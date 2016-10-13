-- Listing 4-11
-- Encrypt data with asymmetric key

-- Wipe out the sample data in the table
TRUNCATE TABLE SalesLT.EncryptedCreditCardInfo;
GO

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
  EncryptByAsymKey(AsymKey_ID(N'AsymKey1_Sales'), CreditCardNumber),
  EncryptByAsymKey(AsymKey_ID(N'AsymKey1_Sales'), CAST 
    (
      CreditCardExpirationDate AS varbinary(10)
    )
  ),
  EncryptByAsymKey(AsymKey_ID(N'AsymKey1_Sales'), CAST
    (
      TotalCharge AS varbinary(10)
    )
  )
FROM SalesLT.CreditCardInfo;
