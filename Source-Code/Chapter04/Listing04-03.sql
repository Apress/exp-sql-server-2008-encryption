-- Listing 4-3
-- Sample credit card info tables

-- Nonencrypted credit card info
CREATE TABLE SalesLT. CreditCardInfo
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


