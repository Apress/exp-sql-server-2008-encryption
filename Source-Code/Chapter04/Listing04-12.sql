-- Listing 4-12
-- Decrypt data with asymmetric key

-- Decrypt the credit card info with asymmetric key
SELECT 
  SalesOrderID,
  CAST
  (
    DecryptByAsymKey
    (
      Asymkey_Id(N'AsymKey1_Sales'), CreditCardNumber
    ) AS nvarchar(100)
  ) AS CreditCardNumber,
  CAST
  (
    DecryptByAsymKey
    (
      Asymkey_Id(N'AsymKey1_Sales'), CreditCardExpirationDate
    ) AS datetime
  ) AS CreditCardExpirationDate,
  CAST
  (
    DecryptByAsymKey
    (
      Asymkey_Id(N'AsymKey1_Sales'), TotalCharge
    ) AS money
  ) AS TotalCharge
FROM SalesLT.EncryptedCreditCardInfo;
