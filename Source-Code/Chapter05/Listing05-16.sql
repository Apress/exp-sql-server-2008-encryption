-- Listing 5-16
-- Encrypting Data with an HSM Symmetric Key

INSERT INTO SalesLT.EncryptedProduct
(
  ProductID,
  Name,
  StandardCost,
  ListPrice
)
SELECT
  ProductID,
  Name,
  EncryptByKey(Key_GUID(N'Luna_AES256_Key'), 
    CAST
    (
      StandardCost AS varbinary(40)
    )
  ),
  EncryptByKey(Key_GUID(N'Luna_AES256_Key'), 
    CAST
    (
      ListPrice AS varbinary(40)
    )
  )
FROM SalesLT.Product;
GO

SELECT
  ProductID,
  Name,
  StandardCost,
  ListPrice
FROM SalesLT.EncryptedProduct;
