-- Listing 7-8
-- Generating Checksum Hash Values for a Table

SELECT
  AddressID,
  CHECKSUM
  (
    AddressLine1,
    AddressLine2,
    City,
    StateProvince,
    CountryRegion,
    PostalCode
  ) AS AddressChecksums
FROM SalesLT.Address;
