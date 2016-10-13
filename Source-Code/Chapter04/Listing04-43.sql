-- Listing 4-43
-- Execute procedure as Joe

-- Execute as Joe
EXECUTE AS LOGIN = N'Joe';
GO

EXEC dbo.LoadStates;
GO

REVERT;
GO
