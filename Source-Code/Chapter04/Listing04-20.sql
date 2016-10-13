-- Listing 4-20
-- Decrypting encrypted addresses

-- Open symmetric data encrypting key
OPEN SYMMETRIC KEY SymKey7_Sales
DECRYPTION BY CERTIFICATE Cert2_Sales;

-- Decrypt sample random credit card data
SELECT 
  AddressID,
  CAST(DecryptByKey(AddressLine1) AS nvarchar(60)),
  CAST(DecryptByKey(AddressLine2) AS nvarchar(60)),
  CAST(DecryptByKey(City) AS nvarchar(30)),
  CAST(DecryptByKey(StateProvince) AS nvarchar(50)),
  CAST(DecryptByKey(CountryRegion) AS nvarchar(50)),
  CAST(DecryptByKey(PostalCode) AS nvarchar(15)),
  rowguid,
  ModifiedDate
FROM SalesLT.EncryptedAddress;

-- Close data encrypting key
CLOSE SYMMETRIC KEY SymKey7_Sales;

