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
    public partial class CustomEncryption
    {
        [Microsoft.SqlServer.Server.SqlFunction
        (
          IsDeterministic = true,
          DataAccess = DataAccessKind.None
        )]
        [return: SqlFacet(MaxSize = -1)]
        public static SqlBytes DecryptAesByPassPhrase
        (
          SqlString PassPhrase,
          [SqlFacet(MaxSize = -1)] SqlBytes Ciphertext,
          SqlBoolean AddAuthenticator,
          SqlString Authenticator
        )
        {
            try
            {
                // Automatically return NULL if passphrase or plaintext is NULL
                if (PassPhrase.IsNull || Ciphertext.IsNull)
                    return SqlBytes.Null;

                // Get the ciphertext into a byte array
                byte[] rawData = Ciphertext.Value;

                // Get the 16-byte salt from the byte array
                byte[] Salt = new byte[16];
                for (int i = 0; i < 16; i++)
                    Salt[i] = rawData[i];

                // Generate hash for authenticator
                SHA1Managed Sha1 = new SHA1Managed();
                string AuthHash = "";    // If no authenticator, use empty string
                // Convert the authenticator hash to Base64 to avoid conversion problems
                if (AddAuthenticator.IsTrue && !Authenticator.IsNull)
                    AuthHash = Convert.ToBase64String
                      (
                        Sha1.ComputeHash(Encoding.Unicode.GetBytes(Authenticator.Value))
                      );
                // Append authenticator to passphrase
                string AuthPass = PassPhrase.Value + AuthHash;

                // Next derive a key from the passphrase + authenticator, with 16-bit Salt
                Rfc2898DeriveBytes keyGenerator = new Rfc2898DeriveBytes(AuthPass, Salt);

                // Create a Rijndael/AES encryption object
                Rijndael Aes = Rijndael.Create();
                Aes.KeySize = 256;
                Aes.Mode = CipherMode.CBC;
                Aes.IV = keyGenerator.GetBytes(Aes.BlockSize >> 3); // Assign the IV
                Aes.Key = keyGenerator.GetBytes(Aes.KeySize >> 3);  // Assign the key

                // Wrap a CryptoStream in a MemoryStream to decrypt the data
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    using
                    (
                      CryptoStream cryptoStream = new CryptoStream
                      (
                        memoryStream,
                        Aes.CreateDecryptor(),
                        CryptoStreamMode.Write
                      )
                    )
                    {
                        // Decrypt and write out the decrypted data with the CryptoStream
                        // ...ignore the leading 16 bytes, the Salt
                        cryptoStream.Write(rawData, 16, rawData.Length - 16);
                        cryptoStream.Close();

                        // Put the decrypted MemoryStream in a byte array and return as SqlBytes
                        byte[] decrypted = memoryStream.ToArray();
                        return new SqlBytes(decrypted);
                    }
                }
            }
            catch
            {
                // If there's an exception return NULL
                return SqlBytes.Null;
            }
        }
    }
}

