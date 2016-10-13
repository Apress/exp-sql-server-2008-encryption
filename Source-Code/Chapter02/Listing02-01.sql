-- Listing 2-1
-- Encryption key backup

BACKUP SERVICE MASTER KEY TO FILE = N'C:\MyServiceMasterKey.key'
ENCRYPTION BY PASSWORD = N'$45^ZeF&u';
