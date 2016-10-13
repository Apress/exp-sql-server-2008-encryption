-- Listing 4-21
-- Encrypting data directly with certificate

-- Wipe out the sample data in the table
TRUNCATE TABLE SalesLT.EncryptedAddress;
GO

-- Encrypt sample random credit card data
INSERT INTO SalesLT.EncryptedAddress
(
  AddressID,
  AddressLine1,
  AddressLine2,
  City,
  StateProvince,
  CountryRegion,
  PostalCode,
  rowguid,
  ModifiedDate
)
SELECT 
  AddressID,
  EncryptByCert(Cert_ID(N'Cert2_Sales'), AddressLine1),
  EncryptByCert(Cert_ID(N'Cert2_Sales'), AddressLine2),
  EncryptByCert(Cert_ID(N'Cert2_Sales'), City),
  EncryptByCert(Cert_ID(N'Cert2_Sales'), StateProvince),
  EncryptByCert(Cert_ID(N'Cert2_Sales'), CountryRegion),
  EncryptByCert(Cert_ID(N'Cert2_Sales'), PostalCode),
  rowguid,
  ModifiedDate
FROM SalesLT.Address;
