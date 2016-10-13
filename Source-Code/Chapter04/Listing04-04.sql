-- Listing 4-4
-- Generate random credit card info 

WITH Generate4Digits /* Generate 4 random digits */
AS
(
  SELECT SUBSTRING
  (
    CAST
      (
        ABS(CHECKSUM(NEWID())) % 10000 AS NVARCHAR(4)
      ) + N'0000', 1, 4
  ) AS Digits
),
CardNum /* Generate a 16 digit random credit card number */
AS
(
  SELECT N'0999-' + 
  (
    SELECT Digits
    FROM Generate4Digits
  ) + N'-' + 
  (
    SELECT Digits
    FROM Generate4Digits
  ) + N'-' +  
  (
    SELECT Digits
    FROM Generate4Digits
  ) AS CardNumber
),
DaysToExpire /* Get a random amount of days to expiration */
AS
(
  SELECT ABS(CHECKSUM(NEWID()) % 700) AS Days
)
INSERT INTO SalesLT.CreditCardInfo
(
  SalesOrderID,
  CreditCardNumber,
  CreditCardExpirationDate,
  TotalCharge	
)
SELECT 
  SalesOrderID,
  CardNumber,
  DATEADD(DAY, Days, OrderDate),
  TotalDue
FROM SalesLT.SalesOrderHeader
CROSS APPLY CardNum
CROSS APPLY DaysToExpire;
