-- Listing 4-14
-- Table to hold encrypted address info

CREATE TABLE SalesLT.EncryptedAddress
(
  AddressID int NOT NULL PRIMARY KEY,
  AddressLine1 varbinary(256) NOT NULL,
  AddressLine2 varbinary(256) NULL,
  City varbinary(256) NOT NULL,
  StateProvince varbinary(256) NOT NULL,
  CountryRegion varbinary(256) NOT NULL,
  PostalCode varbinary(256) NOT NULL,
  rowguid uniqueidentifier NOT NULL,
  ModifiedDate datetime NOT NULL
);

