-- Listing 4-42
-- Create login and user

CREATE LOGIN Joe
WITH PASSWORD = 'p@$$w0rd';
GO

CREATE USER Joe
FOR LOGIN Joe;
GO

GRANT EXECUTE ON dbo.LoadStates
TO Joe;
GO
