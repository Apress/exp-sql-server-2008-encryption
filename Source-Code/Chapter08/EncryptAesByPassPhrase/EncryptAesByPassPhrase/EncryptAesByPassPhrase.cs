using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace Apress.Samples
{
    public partial class SqlEncryption
    {
        [Microsoft.SqlServer.Server.SqlFunction
        (
          IsDeterministic = false,
          DataAccess = DataAccessKind.None
        )]
        [return: SqlFacet(MaxSize = -1)]
        public static SqlBytes EncryptAesByPassPhrase
        (
          SqlString PassPhrase,
          [SqlFacet(MaxSize = -1)] SqlBytes Plaintext,
          SqlBoolean AddAuthenticator,
          SqlString Authenticator
        )
        {
            try
            {
                // Automatically return NULL if passphrase or plaintext is NULL
                if (PassPhrase.IsNull || Plaintext.IsNull)
                    return SqlBytes.Null;

                // Generate hash for authenticator
                SHA1Managed Sha1 = new SHA1Managed();
                string AuthHash = "";  // If authenticator not used, use empty string
                // Convert the authenticator hash to Base64 to avoid conversion problems
                if (AddAuthenticator.IsTrue && !Authenticator.IsNull)
                    AuthHash = Convert.ToBase64String
                    (
                      Sha1.ComputeHash
                      (
                        Encoding.Unicode.GetBytes(Authenticator.Value)
                      )
                    );
                // Append authenticator to passphrase
                string AuthPass = PassPhrase.Value + AuthHash;

                // Next derive a key from the passphrase + authenticator
                // with random 16 byte Salt
                Rfc2898DeriveBytes KeyGenerator = new Rfc2898DeriveBytes(AuthPass, 16);

                // Create a Rijndael/AES encryption object
                Rijndael Aes = Rijndael.Create();
                Aes.KeySize = 256;
                Aes.Mode = CipherMode.CBC;
                Aes.IV = KeyGenerator.GetBytes(Aes.BlockSize >> 3);  // Assign the IV
                Aes.Key = KeyGenerator.GetBytes(Aes.KeySize >> 3);   // Assign the Key

                // Now get the raw plain text
                byte[] rawData = Plaintext.Value;

                // Use a MemoryStream wrapping a CryptoStream with a Rijndael encryptor 
                // to encrypt the data
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    using
                    (
                      CryptoStream cryptoStream = new CryptoStream
                      (
                        memoryStream,
                        Aes.CreateEncryptor(),
                        CryptoStreamMode.Write
                      )
                    )
                    {
                        // First write out the 16 byte salt so we can regenerate the same 
                        // key next time
                        memoryStream.Write(KeyGenerator.Salt, 0, 16);
                        // Now write out the encrypted data
                        cryptoStream.Write(rawData, 0, rawData.Length);
                        cryptoStream.Close();

                        // Convert the encrypted data in memory to an array and return 
                        // as a SqlBytes object
                        byte[] encrypted = memoryStream.ToArray();
                        return new SqlBytes(encrypted);
                    }
                }
            }
            catch
            {
                // Return NULL if an encryption error occurs
                return SqlBytes.Null;
            }
        }
    }
}
