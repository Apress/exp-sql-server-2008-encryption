-- Listing 3-13
-- Creating AES key with the key source option

CREATE SYMMETRIC KEY SymKey5_Sales
WITH ALGORITHM = AES_192,
KEY_SOURCE = N'She sells sea shells by the seashore.',
IDENTITY_VALUE = N'My identity is a shared secret.'
ENCRYPTION BY CERTIFICATE Cert1_Sales;
GO
