-- Listing 4-15
-- Register certificate from files

CREATE CERTIFICATE Cert2_Sales
FROM FILE = N'c:\Cert2_Sales.cer'
WITH PRIVATE KEY 
(
  FILE = N'c:\Cert2_Sales.pvk',
  DECRYPTION BY PASSWORD = N't$%0p}gI'
);

