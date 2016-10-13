-- Listing 5-11
-- Querying the Encrypted Sales Order Detail Data

SELECT
  SalesOrderID,
  SalesOrderDetailID,
  OrderQty,
  ProductID,
  UnitPrice,
  UnitPriceDiscount
FROM SalesLT.EncryptedSalesOrderDetail;
