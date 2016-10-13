-- Listing 4-40
-- Recreate certificate in target database

-- Recreate the certificate in AdventureWorksLT 2008 database
-- from the backup.  Be sure to delete the backup files from
-- the local hard drive after you recreate the certificate!
USE AdventureWorksLT2008;
GO

CREATE CERTIFICATE LoadStates_Cert 
FROM FILE = N'C:\Windows\Temp\LoadStates_Cert.cer'
WITH PRIVATE KEY 
(
  FILE = N'C:\Windows\Temp\LoadStates_Cert.pvk',
  DECRYPTION BY PASSWORD = N'f!133nc#',
  ENCRYPTION BY PASSWORD = N'l0a8p3rm$'
)
GO
