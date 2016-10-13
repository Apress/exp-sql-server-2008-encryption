-- Listing 4-36
-- Querying the log table

SELECT
  LogID,
  SalesOrderID,
  LogDate,
  LogUser
FROM SalesLT.DecryptCreditCardInfoLog;
