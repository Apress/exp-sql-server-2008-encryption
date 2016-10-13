-- Listing 5-10
-- Encrypting Data with an HSM Asymmetric Key

INSERT INTO SalesLT.EncryptedSalesOrderDetail
(
  SalesOrderID,
  SalesOrderDetailID,
  OrderQty,
  ProductID,
  UnitPrice,
  UnitPriceDiscount
)
SELECT 
  SalesOrderID,
  SalesOrderDetailID,
  EncryptByAsymKey(AsymKey_ID(N'Luna_RSA2048_Key'), CAST
    (
      OrderQty AS varbinary(10)
    )
  ),
  EncryptByAsymKey(AsymKey_ID(N'Luna_RSA2048_Key'), CAST
    (	
	  ProductID AS varbinary(10)
	)
  ),
  EncryptByAsymKey(AsymKey_ID(N'Luna_RSA2048_Key'), CAST
    (
      UnitPrice AS varbinary(40)
    )
  ),
  EncryptByAsymKey(AsymKey_ID(N'Luna_RSA2048_Key'), CAST
    (
      UnitPriceDiscount AS varbinary(40)
    )
  )
FROM SalesLT.SalesOrderDetail;
GO
