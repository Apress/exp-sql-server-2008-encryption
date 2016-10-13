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
        public static SqlBytes GetHash
        (
          SqlString Algorithm,
          [SqlFacet(MaxSize = -1)] SqlBytes Plaintext
        )
        {
            // Return NULL if Algorithm or Plaintext is NULL
            if (Algorithm.IsNull || Plaintext.IsNull)
                return SqlBytes.Null;

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

            // Generate the hash value
            byte[] HashBytes = Hash.ComputeHash(Plaintext.Value);
            // Convert result into a SqlBytes result
            return new SqlBytes(HashBytes);
        }
    }
}

