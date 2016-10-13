-- Listing 5-7
-- Creating a Symmetric Key Protected by an HSM Asymmetric Key

CREATE SYMMETRIC KEY SymKey_ProtectedByLunaKey
WITH ALGORITHM = AES_256
ENCRYPTION BY ASYMMETRIC KEY Luna_RSA2048_Key;

