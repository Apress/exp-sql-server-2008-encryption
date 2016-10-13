-- Listing 7-7
-- MD5 Hashing of Rows in a Table

SELECT
  AddressID,
  AddressLine1,
  AddressLine2,
  City,
  StateProvince,
  CountryRegion,
  PostalCode,
  HashBytes
  (
    'MD5',
    COALESCE(AddressLine1, 0x00) + '|' +
    COALESCE(AddressLine2, 0x00) + '|' +
    COALESCE(City, 0x00) + '|' +
    COALESCE(StateProvince, 0x00) + '|' +
    COALESCE(CountryRegion, 0x00) + '|' +
    COALESCE(PostalCode, 0x00) + '|'
  ) AS AddressHash
INTO SalesLT.AddressHash
FROM SalesLT.Address;
GO

SELECT
  AddressID,
  AddressLine1,
  AddressLine2,
  City,
  StateProvince,
  CountryRegion,
  PostalCode,
  AddressHash
FROM SalesLT.AddressHash;
GO
