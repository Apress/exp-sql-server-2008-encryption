-- Listing 2-2
-- Encryption key restore

RESTORE SERVICE MASTER KEY FROM FILE = N'C:\MyServiceMasterKey.key'
DECRYPTION BY PASSWORD = N'$45^ZeF&u';
