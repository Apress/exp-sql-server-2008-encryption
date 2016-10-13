-- Listing 5-15
-- Creating Table to Hold Encrypted Product Price Information

CREATE TABLE SalesLT.EncryptedProduct
(
  ProductID int not null primary key,
  Name nvarchar(50),
  StandardCost varbinary(80),
  ListPrice varbinary(80)
);
GO

