-- Listing 9-5
-- Querying the Sample Data with the Last Four Credit Card Digits

SELECT
  SalesOrderID,
  CreditCardLast4,
  CreditCardNumber,
  CreditCardExpirationDate,
  TotalCharge
FROM SalesLT.EncryptedCreditCardInfo;
