-- Listing 6-7
-- Creating a Credential and a Login for the EKM

CREATE CREDENTIAL TDE_Luna_Credential
WITH IDENTITY = 'SQL2008\Michael',		-- Replace with your ID
SECRET = 'x9SP-PH9C-L/FK-q/TW'			-- Replace with your secret
FOR CRYPTOGRAPHIC PROVIDER LunaEKMProvider;
GO

CREATE LOGIN TDE_Luna_Login
FROM ASYMMETRIC KEY TDE_Luna_AsymKey;
GO

ALTER LOGIN TDE_Luna_Login
ADD CREDENTIAL TDE_Luna_Credential;
GO

