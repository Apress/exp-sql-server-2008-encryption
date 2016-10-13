-- Listing 4-10
-- Remove password encryption from asymmetric key

ALTER ASYMMETRIC KEY AsymKey1_Sales
WITH PRIVATE KEY (DECRYPTION BY PASSWORD = N'%ui!@90~p');


