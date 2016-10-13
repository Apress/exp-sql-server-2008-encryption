-- Listing 3-10
-- Decrypting data without "automatic key management"

-- Open the DMK that's protected by password; necessary because
-- the certificate is protected by the DMK
OPEN MASTER KEY 
DECRYPTION BY PASSWORD = N'a0*Ui)4x-f';
GO

-- Open the symmetric key that's protected by certificate
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

-- Close the key and DMK
CLOSE SYMMETRIC KEY SymKey1_Sales;
GO

CLOSE MASTER KEY;
GO
