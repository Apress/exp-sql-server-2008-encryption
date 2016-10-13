-- Listing 3-12
-- Decrypting data with symmetric key, protected by password

-- Open the symmetric key that's protected by password
OPEN SYMMETRIC KEY SymKey1_Sales 
DECRYPTION BY PASSWORD = N'~@~*&a1B4!';
GO

-- Decrypt the data
SELECT
  CustomerID,
  CAST(DecryptByKey(FirstName) AS nvarchar(100)) AS DecryptedFirstName,
  FirstName
FROM SalesLT.EncryptedCustomer;
GO

-- Close the symmetric key
CLOSE SYMMETRIC KEY SymKey1_Sales;
GO
