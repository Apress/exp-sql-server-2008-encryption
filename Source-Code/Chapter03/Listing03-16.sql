-- Listing 3-16
-- Layering symmetric keys

-- Create a symmetric key, protect it with a certificate
CREATE SYMMETRIC KEY SymKey2_Sales
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE Cert1_Sales;
GO

-- Open top-level symmetric key
OPEN SYMMETRIC KEY SymKey2_Sales
DECRYPTION BY CERTIFICATE Cert1_Sales;
GO

-- Create the next symmetric key, protect it with the top-level symmetric key
CREATE SYMMETRIC KEY SymKey3_Sales
WITH ALGORITHM = AES_192
ENCRYPTION BY SYMMETRIC KEY SymKey2_Sales;
GO

-- Open the previously created symmetric key
OPEN SYMMETRIC KEY SymKey3_Sales
DECRYPTION BY SYMMETRIC KEY SymKey2_Sales;
GO

-- Create the bottom-level symmetric key, protect it with the previous key
CREATE SYMMETRIC KEY SymKey4_Sales
WITH ALGORITHM = AES_128
ENCRYPTION BY SYMMETRIC KEY SymKey3_Sales;
GO

-- Close all open keys
CLOSE SYMMETRIC KEY SymKey3_Sales;
GO

CLOSE SYMMETRIC KEY SymKey2_Sales;
GO


