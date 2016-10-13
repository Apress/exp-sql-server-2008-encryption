using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Security.Cryptography;

namespace Apress.Samples
{
    public partial class CustomEncryption
    {
        [Microsoft.SqlServer.Server.SqlFunction
        (
          IsDeterministic = true,
          DataAccess = DataAccessKind.None
        )]
        public static SqlBytes SaltedHash
        (
          SqlString Algorithm,
          [SqlFacet(MaxSize = -1)] SqlBytes PlainText,
          SqlBytes Salt
        )
        {
            // Return NULL if any of the parameters is NULL
            if (Algorithm.IsNull || PlainText.IsNull || Salt.IsNull)
                return SqlBytes.Null;

            // Determine which algorithm to use
            bool HashDefined = true;
            HashAlgorithm Hash = null;
            switch (Algorithm.Value.ToUpper())
            {
                case "SHA256":
                    Hash = new SHA256Managed();
                    break;

                case "SHA384":
                    Hash = new SHA384Managed();
                    break;

                case "SHA512":
                    Hash = new SHA512Managed();
                    break;

                default:
                    HashDefined = false;
                    break;
            }
            if (!HashDefined)
                throw new Exception
                  ("Unsupported hash algorithm - use SHA256, SHA384 or SHA512");

            // Combine the plaintext with the salt
            byte[] PlainTextWithSalt = new byte[PlainText.Length + Salt.Length];
            for (long i = 0; i < Salt.Length; i++)
                PlainTextWithSalt[i] = Salt[i];
            for (long i = Salt.Length; i < PlainText.Length; i++)
                PlainTextWithSalt[i] = PlainText.Value[i - Salt.Length];

            // Generate the hash and return the result
            byte[] HashBytes = Hash.ComputeHash(PlainTextWithSalt);
            return new SqlBytes(HashBytes);
        }
    }
}

