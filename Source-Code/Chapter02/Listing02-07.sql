-- Listing 2-7
-- Add and remove DMK encryption by password

-- Add encryption by password
ALTER MASTER KEY ADD ENCRYPTION BY PASSWORD = N'9(%^jQ!@#d';
GO

-- Remove encryption by password
ALTER MASTER KEY DROP ENCRYPTION BY PASSWORD = N'9(%^jQ!@#d';
GO


