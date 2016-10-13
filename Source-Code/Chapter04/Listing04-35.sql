-- Listing 4-35
-- Bob tries (and succeeds) to execute a proc

EXECUTE AS USER = N'Bob';
EXEC SalesLT.GetOrderSummary 71774;
REVERT;
GO
