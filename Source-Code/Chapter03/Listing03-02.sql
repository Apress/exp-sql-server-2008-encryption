-- Listing 3-2
-- Create a certificate

CREATE CERTIFICATE Cert1_Sales
WITH SUBJECT = N'Sales Certificate',
START_DATE = N'2009-01-01',
EXPIRY_DATE = N'2018-12-31';
GO
