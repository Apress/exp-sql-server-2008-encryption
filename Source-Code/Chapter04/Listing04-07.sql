-- Listing 4-7
-- Decrypting credit card data

-- Open symmetric data encrypting key
OPEN SYMMETRIC KEY SymKey6_Sales
DECRYPTION BY ASYMMETRIC KEY AsymKey1_Sales;

-- Decrypt previously encrypted credit card data
SELECT 
  SalesOrderID,
  CAST
  (
    DecryptByKey(CreditCardNumber) AS nvarchar(100)
  ) AS CreditCardNumber,
  CAST
  (
    DecryptByKey(CreditCardExpirationDate) AS datetime
  ) AS CreditCardExpirationDate,
  CAST
  (
    DecryptByKey(TotalCharge) AS money
  ) AS TotalDue
FROM SalesLT.EncryptedCreditCardInfo;

-- Close data encrypting key
CLOSE SYMMETRIC KEY SymKey6_Sales;
