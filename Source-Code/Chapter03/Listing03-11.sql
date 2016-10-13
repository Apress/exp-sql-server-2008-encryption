-- Listing 3-11
-- Using encryption by password for symmetric key

-- Open the DMK that's protected by password
OPEN MASTER KEY 
DECRYPTION BY PASSWORD = N'a0*Ui)4x-f';
GO

-- Open the data encrypting key
OPEN SYMMETRIC KEY SymKey1_Sales
DECRYPTION BY CERTIFICATE Cert1_Sales;
GO

-- Add encryption by password to the key
ALTER SYMMETRIC KEY SymKey1_Sales
ADD ENCRYPTION BY PASSWORD = N'~@~*&a1B4!';
GO

-- Drop certificate protection from the key
ALTER SYMMETRIC KEY SymKey1_Sales
DROP ENCRYPTION BY CERTIFICATE Cert1_Sales;
GO

-- Close the key and DMK
CLOSE SYMMETRIC KEY SymKey1_Sales;
GO

CLOSE MASTER KEY;
GO
