-- Listing 4-28
-- Create logging table and encrypt credit card info

-- Create a logging table
CREATE TABLE SalesLT.DecryptCreditCardInfoLog
(
  LogID int not null identity(1, 1) primary key,
  SalesOrderID int,
  LogDate datetime,
  LogUser sysname
);
GO

-- Wipe out the sample data in the table
TRUNCATE TABLE SalesLT.EncryptedCreditCardInfo;
GO

OPEN SYMMETRIC KEY SymKey7_Sales
DECRYPTION BY CERTIFICATE Cert2_Sales;

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
  EncryptByKey(Key_GUID(N'SymKey7_Sales'), CreditCardNumber),
  EncryptByKey(Key_GUID(N'SymKey7_Sales'), CAST 
    (
      CreditCardExpirationDate AS varbinary(10)
    )
  ),
  EncryptByKey(Key_GUID(N'SymKey7_Sales'), CAST
    (
      TotalCharge AS varbinary(10)
    )
  )
FROM SalesLT.CreditCardInfo;

CLOSE SYMMETRIC KEY SymKey7_Sales;
GO
