-- Listing 4-33
-- Bob tries (and fails) to execute the procs

EXECUTE AS USER = N'Bob';
SELECT *
FROM SalesLT.EncryptedCreditCardInfo;
REVERT;
GO

EXECUTE AS USER = N'Bob';
EXEC SalesLT.GetOrderSummary 71774;
REVERT;
GO
