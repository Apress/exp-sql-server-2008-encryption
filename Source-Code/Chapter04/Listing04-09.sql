-- Listing 4-9
-- Decrypt by symmetric key with auto asymmetric key

-- Decrypt previously encrypted credit card data
SELECT 
  SalesOrderID,
  CAST
  (
    DecryptByKeyAutoAsymKey
      (
        AsymKey_ID(N'AsymKey1_Sales'), 
        N'%ui!@90~p', 
        CreditCardNumber
      ) AS nvarchar(100)
  ) AS CreditCardNumber
FROM SalesLT.EncryptedCreditCardInfo;

