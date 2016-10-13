-- Listing 3-4
-- Encrypt data with a symmetric key

-- First wipe out the target table
TRUNCATE TABLE SalesLT.EncryptedCustomer;
GO

-- Open the key that's protected by certificate
OPEN SYMMETRIC KEY SymKey1_Sales
DECRYPTION BY CERTIFICATE Cert1_Sales;
GO

-- Encrypt the data
INSERT INTO SalesLT.EncryptedCustomer
(
  CustomerID,
  FirstName,
  MiddleName,
  LastName,
  EmailAddress,
  Phone,
  rowguid
)
SELECT
  CustomerID,
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), FirstName),
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), MiddleName),
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), LastName),
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), EmailAddress),
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), Phone),
  rowguid
FROM SalesLT.Customer;
GO

-- Close the key
CLOSE SYMMETRIC KEY SymKey1_Sales;
GO


