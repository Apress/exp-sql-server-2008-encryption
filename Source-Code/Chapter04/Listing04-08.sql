-- Listing 4-8
-- Add password encryption to asymmetric key

ALTER ASYMMETRIC KEY AsymKey1_Sales
WITH PRIVATE KEY (ENCRYPTION BY PASSWORD = N'%ui!@90~p');
