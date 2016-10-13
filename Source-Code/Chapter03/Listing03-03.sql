-- Listing 3-3
-- Create a AES 256 symmetric key

CREATE SYMMETRIC KEY SymKey1_Sales
WITH ALGORITHM = AES_256,
  IDENTITY_VALUE = N'Barbarians at the Gate',
  KEY_SOURCE = N'We will leave the light on for you'
ENCRYPTION BY CERTIFICATE Cert1_Sales;
GO 

