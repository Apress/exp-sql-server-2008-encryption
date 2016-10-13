-- Listing 2-10
-- Restoring a DMK

RESTORE MASTER KEY FROM FILE = N'C:\MyDatabaseMasterKey.key' 
DECRYPTION BY PASSWORD = N'0-!t4=Rtr=,'
ENCRYPTION BY PASSWORD = N'p#v8A0@+|';

