-- Listing 9-1
-- Creating Encryption Keys and Sample Data

-- Create DMK, asymmetric key, symmetric key
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'a0*Ui)4x-f';
GO

CREATE ASYMMETRIC KEY AsymKey1_Sales
FROM FILE = N'c:\AsymKey1_Sales.snk';
GO

CREATE SYMMETRIC KEY SymKey6_Sales
WITH ALGORITHM = AES_256
ENCRYPTION BY ASYMMETRIC KEY AsymKey1_Sales;
GO

-- Nonencrypted credit card info
CREATE TABLE SalesLT.CreditCardInfo
(
  SalesOrderID int not null primary key,
  CreditCardNumber nvarchar(50),
  CreditCardExpirationDate datetime,
  TotalCharge money
);

-- Encrypted credit card info
CREATE TABLE SalesLT.EncryptedCreditCardInfo
(
  SalesOrderID int not null primary key,
  CreditCardNumber varbinary(150),
  CreditCardExpirationDate varbinary(150),
  TotalCharge varbinary(150)		
);
GO

-- Generate plaintext sample data
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
GO

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
GO
