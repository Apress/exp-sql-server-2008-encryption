-- Listing 3-8
-- Decrypting with an authenticator

-- Open the data key that's protected by certificate
OPEN SYMMETRIC KEY SymKey1_Sales
DECRYPTION BY CERTIFICATE Cert1_Sales;
GO

-- Decrypt the data with authenticator
SELECT
  CustomerID,
  CAST
  (
    DecryptByKey(FirstName, 1, CAST(rowguid AS nvarchar(100))
  ) AS nvarchar(100)) AS DecryptedFirstName,
  FirstName
FROM SalesLT.EncryptedCustomer;
GO

-- Close the symmetric key
CLOSE SYMMETRIC KEY SymKey1_Sales;
GO
