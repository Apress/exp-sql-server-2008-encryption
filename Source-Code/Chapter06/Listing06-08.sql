-- Listing 6-8
-- Creating a DEK and Turning on TDE

USE AdventureWorksLT2008;
GO

CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER ASYMMETRIC KEY TDE_Luna_AsymKey;
GO

ALTER DATABASE AdventureWorksLT2008
SET ENCRYPTION ON;
