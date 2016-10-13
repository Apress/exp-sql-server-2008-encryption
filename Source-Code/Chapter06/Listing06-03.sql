-- Listing 6-3
-- Backing Up the Server Certificate

USE master;
GO

BACKUP CERTIFICATE TDE_Certificate
TO FILE = N'c:\Server_Certificate.cer'
WITH PRIVATE KEY
(
  FILE = N'c:\Server_Certificate.pvk',
  ENCRYPTION BY PASSWORD = N'$$um)3l0q:'
);
GO
