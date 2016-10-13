-- Listing 9-15
-- First get a decrypted credit card number from the plaintext table

DECLARE @n nvarchar(50);

SELECT @n = CreditCardNumber
FROM SalesLT.CreditCardInfo
WHERE SalesOrderID = 71780;

-- Open the symmetric key
OPEN SYMMETRIC KEY SymKey6_Sales
DECRYPTION BY ASYMMETRIC KEY AsymKey1_Sales;

-- Perform the search and return the result
SELECT
  SalesOrderID,
  CAST(DecryptByKey(CreditCardNumber) AS nvarchar(50)) AS DecCreditCardNumber
FROM SalesLT.EncryptedCreditCardInfo
WHERE CreditCardHash = dbo.GetHmac
  (
    'SHA256',
    CAST(@n AS varbinary(100)),
    0x359a82109cfe
  )
  AND DecryptByKey(CreditCardNumber) = @n;

-- Close symmetric key
CLOSE SYMMETRIC KEY SymKey6_Sales;
