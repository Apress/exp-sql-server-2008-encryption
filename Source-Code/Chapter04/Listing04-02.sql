-- Listing 4-2
-- Protecting symmetric key with asymmetric key

CREATE SYMMETRIC KEY SymKey6_Sales
WITH ALGORITHM = AES_256
ENCRYPTION BY ASYMMETRIC KEY AsymKey1_Sales;

