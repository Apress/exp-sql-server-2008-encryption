-- Listing 3-14
-- Creating temporary AES key with the key source option

CREATE SYMMETRIC KEY #TempAESKey
WITH ALGORITHM = AES_128,
KEY_SOURCE = N'I am the very model of a modern major general',
IDENTITY_VALUE = N'I think therefore I am'
ENCRYPTION BY CERTIFICATE Cert1_Sales;
GO

