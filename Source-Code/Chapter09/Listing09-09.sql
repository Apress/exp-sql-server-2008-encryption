-- Listing 9-9
-- Querying the Encrypted Credit Card Info with Credit Card Hash

SELECT
  SalesOrderID,
  CreditCardHash,
  CreditCardNumber,
  CreditCardExpirationDate,
  TotalCharge
FROM SalesLT.EncryptedCreditCardInfo;
