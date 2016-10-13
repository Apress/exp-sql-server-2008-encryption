-- Listing 3-6
-- View encrypted character data

-- Open the key that's protected by certificate
OPEN SYMMETRIC KEY SymKey1_Sales
DECRYPTION BY CERTIFICATE Cert1_Sales;
GO

-- Decrypt the data
SELECT
  CustomerID,
  CAST(DecryptByKey(FirstName) AS nvarchar(100)) AS DecryptedFirstName,
  FirstName
FROM SalesLT.EncryptedCustomer;
GO

-- Close the key
CLOSE SYMMETRIC KEY SymKey1_Sales;
GO

