-- Listing 4-18
-- Encrypt with symmetric key protected by certificate

-- Wipe out the sample data in the table
TRUNCATE TABLE SalesLT.EncryptedAddress;
GO

-- Open symmetric data encrypting key
OPEN SYMMETRIC KEY SymKey7_Sales
DECRYPTION BY CERTIFICATE Cert2_Sales;

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
  EncryptByKey(Key_Guid(N'SymKey7_Sales'), AddressLine1),
  EncryptByKey(Key_Guid(N'SymKey7_Sales'), AddressLine2),
  EncryptByKey(Key_Guid(N'SymKey7_Sales'), City),
  EncryptByKey(Key_Guid(N'SymKey7_Sales'), StateProvince),
  EncryptByKey(Key_Guid(N'SymKey7_Sales'), CountryRegion),
  EncryptByKey(Key_Guid(N'SymKey7_Sales'), PostalCode),
  rowguid,
  ModifiedDate
FROM SalesLT.Address;

-- Close data encrypting key
CLOSE SYMMETRIC KEY SymKey7_Sales;
