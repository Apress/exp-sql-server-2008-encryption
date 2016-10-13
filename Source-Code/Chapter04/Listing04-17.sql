-- Listing 4-17
-- Protect symmetric key with certificate

CREATE SYMMETRIC KEY SymKey7_Sales
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE Cert2_Sales;
