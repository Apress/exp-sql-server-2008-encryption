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
        public static SqlBytes GetHmac
        (
          SqlString Algorithm,
          [SqlFacet(MaxSize = -1)] SqlBytes PlainText,
          SqlBytes Key
        )
        {
            if (Algorithm.IsNull || PlainText.IsNull || Key.IsNull)
                return SqlBytes.Null;
            bool HmacDefined = true;
            HMAC Hmac = null;
            switch (Algorithm.Value.ToUpper())
            {
                case "SHA256":
                    Hmac = new HMACSHA256(Key.Value);
                    break;

                case "SHA384":
                    Hmac = new HMACSHA384(Key.Value);
                    break;

                case "SHA512":
                    Hmac = new HMACSHA512(Key.Value);
                    break;

                case "RIPEMD160":
                    Hmac = new HMACRIPEMD160(Key.Value);
                    break;

                default:
                    HmacDefined = false;
                    break;
            }
            if (!HmacDefined)
                throw new Exception
                  (
                     "Unsupported hash algorithm - use SHA256, SHA384, SHA512 or RIPEMD160"
                  );
            byte[] HmacBytes = Hmac.ComputeHash(PlainText.Value);
            return new SqlBytes(HmacBytes);
        }
    }
}

