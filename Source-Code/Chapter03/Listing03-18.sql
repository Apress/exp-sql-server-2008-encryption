-- Listing 3-18
-- Decrypting data with layered symmetric keys

-- Open the top-level symmetric key that's protected by certificate
OPEN SYMMETRIC KEY SymKey2_Sales
DECRYPTION BY CERTIFICATE Cert1_Sales;
GO

-- Open the key that's protected by the top-level key
OPEN SYMMETRIC KEY SymKey3_Sales
DECRYPTION BY SYMMETRIC KEY SymKey2_Sales;
GO

-- Open the data encrypting key that's protected by the previous key
OPEN SYMMETRIC KEY SymKey4_Sales
DECRYPTION BY SYMMETRIC KEY SymKey3_Sales;
GO

-- Decrypt the data
SELECT
  CustomerID,
  CAST(DecryptByKey(FirstName) AS nvarchar(100)) AS DecryptedFirstName,
  FirstName
FROM SalesLT.EncryptedCustomer;
GO

-- Close all the keys
CLOSE ALL SYMMETRIC KEYS;
GO
