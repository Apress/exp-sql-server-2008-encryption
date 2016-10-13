-- Listing 4-32
-- Give Bob permissions

CREATE USER Bob
WITHOUT LOGIN;
GO

GRANT EXECUTE ON SalesLT.GetOrderSummary
TO Bob;
GO
