-- Listing 5-12
-- Decrypting Data with an HSM-enabled Asymmetric Key

SELECT
  SalesOrderID,
  SalesOrderDetailID,
  CAST
  (
    DecryptByAsymKey(AsymKey_ID(N'Luna_RSA2048_Key'), 
      OrderQty) AS smallint
  ) AS OrderQty,
  CAST
  (
    DecryptByAsymKey(AsymKey_ID(N'Luna_RSA2048_Key'), 
      ProductID) AS int
  ) AS ProductID,
  CAST
  (
    DecryptByAsymKey(AsymKey_ID(N'Luna_RSA2048_Key'), 
      UnitPrice) AS money
  ) AS UnitPrice,
  CAST
  (
    DecryptByAsymKey(AsymKey_ID(N'Luna_RSA2048_Key'), 
      UnitPriceDiscount) AS money
  ) AS UnitPriceDiscount
FROM SalesLT.EncryptedSalesOrderDetail;
