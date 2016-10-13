-- Listing 5-17
-- Decrypting Data with an HSM Symmetric Key

SELECT
  ProductID,
  Name,
  CAST(DecryptByKey(StandardCost) AS money) AS StandardCost,
  CAST(DecryptByKey(ListPrice) AS money) AS ListPrice
FROM SalesLT.EncryptedProduct;
