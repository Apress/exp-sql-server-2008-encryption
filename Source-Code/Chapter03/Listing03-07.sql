-- Listing 3-7
-- Encrypting with an authenticator

-- First wipe out the target table
TRUNCATE TABLE SalesLT.EncryptedCustomer;
GO

-- Open the key that's protected by certificate
OPEN SYMMETRIC KEY SymKey1_Sales
DECRYPTION BY CERTIFICATE Cert1_Sales;
GO

-- Encrypt the data with authenticator
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
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), FirstName, 1, 
    CAST(rowguid AS nvarchar(100))),
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), MiddleName, 1, 
    CAST(rowguid AS nvarchar(100))),
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), LastName, 1, 
    CAST(rowguid AS nvarchar(100))),
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), EmailAddress, 1, 
    CAST(rowguid AS nvarchar(100))),
  EncryptByKey(Key_Guid(N'SymKey1_Sales'), Phone, 1, 
    CAST(rowguid AS nvarchar(100))),
  rowguid
FROM SalesLT.Customer;
GO

-- Close the key
CLOSE SYMMETRIC KEY SymKey1_Sales;
GO
