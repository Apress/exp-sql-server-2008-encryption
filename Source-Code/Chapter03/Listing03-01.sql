-- Listing 3-1
-- Enumerate database encryption keys

CREATE TABLE SalesLT.EncryptedCustomer
(
  CustomerID   int NOT NULL PRIMARY KEY,
  FirstName    varbinary(200),
  MiddleName   varbinary(200),
  LastName     varbinary(200),
  EmailAddress varbinary(200),
  Phone        varbinary(150),
  rowguid      uniqueidentifier
);
GO

