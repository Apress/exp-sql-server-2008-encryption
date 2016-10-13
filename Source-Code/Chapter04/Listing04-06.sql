-- Listing 4-6
-- Encrypt credit card data

-- Wipe out the sample data in the table
TRUNCATE TABLE SalesLT.EncryptedCreditCardInfo;
GO

-- Open symmetric data encrypting key
OPEN SYMMETRIC KEY SymKey6_Sales
DECRYPTION BY ASYMMETRIC KEY AsymKey1_Sales;

-- Encrypt sample random credit card data
INSERT INTO SalesLT.EncryptedCreditCardInfo
(
  SalesOrderID,
  CreditCardNumber,
  CreditCardExpirationDate,
  TotalCharge	
)
SELECT 
  SalesOrderID,
  EncryptByKey(Key_Guid(N'SymKey6_Sales'), CreditCardNumber),
  EncryptByKey(Key_Guid(N'SymKey6_Sales'), CAST 
    (
      CreditCardExpirationDate AS varbinary(10)
    )
  ),
  EncryptByKey(Key_Guid(N'SymKey6_Sales'), CAST
    (
      TotalCharge AS varbinary(10)
    )
  )
FROM SalesLT.CreditCardInfo;

-- Close data encrypting key
CLOSE SYMMETRIC KEY SymKey6_Sales;
