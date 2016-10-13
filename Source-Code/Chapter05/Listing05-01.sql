-- Listing 5-1
-- Enabling EKM functionality in SQL Server

EXEC sp_configure 'show advanced options', 1;
GO

RECONFIGURE;
GO

EXEC sp_configure 'EKM provider enabled', 1;
GO

RECONFIGURE;
GO
