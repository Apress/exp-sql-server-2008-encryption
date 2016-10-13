-- Listing 4-19
-- Querying binary encrypted addresses

SELECT 
  AddressID,
  AddressLine1,
  AddressLine2,
  City,
  StateProvince,
  CountryRegion,
  PostalCode,
  rowguid,
  ModifiedDate
FROM SalesLT.EncryptedAddress;
