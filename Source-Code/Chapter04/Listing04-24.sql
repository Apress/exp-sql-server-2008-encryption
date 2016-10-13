-- Listing 4-24
-- Restoring a backed up certificate

DROP CERTIFICATE Cert3_Sales;
GO

CREATE CERTIFICATE Cert3_Sales
FROM FILE = N'c:\Cert3_Sales.cer'
WITH PRIVATE KEY
(
  FILE = N'c:\Cert3_Sales.pvk',
  DECRYPTION BY PASSWORD = N'@oo$k3-9!'
);
