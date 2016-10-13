-- Listing 6-2
-- Create a Server Certificate

USE master;
GO

CREATE CERTIFICATE TDE_Certificate
WITH SUBJECT = N'TDE Encryption Server Certificate';
GO
