-- Listing 5-2
-- Registering the Luna SA Ccryptographic Pprovider with SQL Server

CREATE CRYPTOGRAPHIC PROVIDER LunaEKMProvider
FROM FILE = N'c:\LunaSA\EKM\LunaEKM.dll';
