-- Listing 5-3
-- Creating an EKM Ccredential

CREATE CREDENTIAL LunaEKMCredential
WITH IDENTITY = 'SQL2008\Michael',		-- Replace with your ID
SECRET = 'x9SP-PH9C-L/FK-q/TW'			-- Replace with your secret
FOR CRYPTOGRAPHIC PROVIDER LunaEKMProvider;
GO

ALTER LOGIN [SQL2008\Michael]			-- Replace with your login
ADD CREDENTIAL LunaEKMCredential;
GO
