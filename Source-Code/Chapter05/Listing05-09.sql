-- Listing 5-9
-- Create a Table to Hold Encrypted Sales Order Detail Information

CREATE TABLE SalesLT.EncryptedSalesOrderDetail
(
  SalesOrderID int not null,
  SalesOrderDetailID int not null,
  OrderQty varbinary(256) not null,
  ProductID varbinary(256) not null,
  UnitPrice varbinary(256) not null,
  UnitPriceDiscount varbinary(256) not null,
  PRIMARY KEY (SalesOrderID, SalesOrderDetailID)
);
GO
