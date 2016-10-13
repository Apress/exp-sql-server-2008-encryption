-- Listing 3-17
-- Encrypting data with layered symmetric keys

-- First wipe out the target table
TRUNCATE TABLE SalesLT.EncryptedCustomer;
GO

-- Open the multiple levels of symmetric keys
OPEN SYMMETRIC KEY SymKey2_Sales
DECRYPTION BY CERTIFICATE Cert1_Sales;
GO

OPEN SYMMETRIC KEY SymKey3_Sales
DECRYPTION BY SYMMETRIC KEY SymKey2_Sales;
GO

OPEN SYMMETRIC KEY SymKey4_Sales
DECRYPTION BY SYMMETRIC KEY SymKey3_Sales;
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
  EncryptByKey(Key_GUID(N'SymKey4_Sales'), FirstName),
  EncryptByKey(Key_GUID(N'SymKey4_Sales'), MiddleName),
  EncryptByKey(Key_GUID(N'SymKey4_Sales'), LastName),
  EncryptByKey(Key_GUID(N'SymKey4_Sales'), EmailAddress),
  EncryptByKey(Key_GUID(N'SymKey4_Sales'), Phone),
  rowguid
FROM SalesLT.Customer;
GO

-- Close the symmetric keys
CLOSE ALL SYMMETRIC KEYS;
GO
