-- Listing 4-23
-- Backup a certificate

BACKUP CERTIFICATE Cert3_Sales
TO FILE = N'c:\Cert3_Sales.cer'
WITH PRIVATE KEY
(
  FILE = N'c:\Cert3_Sales.pvk',
  ENCRYPTION BY PASSWORD = N'@oo$k3-9!'
);
