-- Listing 4-22
-- Decrypting data directly with certificate

SELECT 
  AddressID,
  CAST
  (
    DecryptByCert(Cert_ID(N'Cert2_Sales'), AddressLine1) AS nvarchar(60)
  ),
  CAST
  (
    DecryptByCert(Cert_ID(N'Cert2_Sales'), AddressLine2) AS nvarchar(60)
  ),
  CAST
  (
    DecryptByCert(Cert_ID(N'Cert2_Sales'), City) AS nvarchar(30)
  ),
  CAST
  (
    DecryptByCert(Cert_ID(N'Cert2_Sales'), StateProvince) AS nvarchar(50)
  ),
  CAST
  (
    DecryptByCert(Cert_ID(N'Cert2_Sales'), CountryRegion) AS nvarchar(50)
  ),
  CAST
  (
    DecryptByCert(Cert_ID(N'Cert2_Sales'), PostalCode) AS nvarchar(15)
  ),
  rowguid,
  ModifiedDate
FROM SalesLT.EncryptedAddress;
