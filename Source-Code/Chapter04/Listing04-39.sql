-- Listing 4-39
-- Create certificate and login

-- Create certificate in master database
USE master;
GO

CREATE CERTIFICATE LoadStates_Cert
   ENCRYPTION BY PASSWORD = N'l0a8p3rm$'
   WITH SUBJECT = N'Load states permissions',
   START_DATE = '2009-01-01',
   EXPIRY_DATE = '2016-01-01'
GO

-- Create a login for the certificate
CREATE LOGIN LoadStates_Login 
FROM CERTIFICATE LoadStates_Cert;
GO

-- Assign "Administer Bulk Operations" permissions to the login
GRANT ADMINISTER BULK OPERATIONS 
TO LoadStates_Login;
GO

-- Backup the certificate to a file
BACKUP CERTIFICATE LoadStates_Cert
TO FILE = N'C:\Windows\Temp\LoadStates_Cert.cer'
WITH PRIVATE KEY
(
  FILE = N'C:\Windows\Temp\LoadStates_Cert.pvk' ,
  ENCRYPTION BY PASSWORD = N'f!133nc#',
  DECRYPTION BY PASSWORD = N'l0a8p3rm$'
);
GO
