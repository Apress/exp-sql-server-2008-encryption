-- Listing 4-5
-- Query unencrypted credit card info

SELECT
  SalesOrderID,
  CreditCardNumber,
  CreditCardExpirationDate,
  TotalCharge	
FROM SalesLT.CreditCardInfo;
