-- Listing 4-30
-- Create certificate and certificate user

CREATE CERTIFICATE Cert_SignModules
WITH SUBJECT = N'Certificate to sign modules',
START_DATE = '2009-01-01',
EXPIRY_DATE = '2020-12-31';
GO

CREATE USER CCDecryptor
FOR CERTIFICATE Cert_SignModules;
GO
