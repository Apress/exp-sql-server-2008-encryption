-- Listing 4-16
-- Create self-signed certificate on SQL Server

CREATE CERTIFICATE Cert3_Sales
WITH SUBJECT = N'SQL Server 2008 Test Certificate 3',
START_DATE = '2009-01-01',
EXPIRY_DATE = '2020-12-31';
