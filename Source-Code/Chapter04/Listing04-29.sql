-- Listing 4-29
-- Procedure to decrypt credit card info

CREATE PROCEDURE SalesLT.GetOrderSummary @SalesOrderID int
AS
BEGIN
  OPEN SYMMETRIC KEY SymKey7_Sales
  DECRYPTION BY CERTIFICATE Cert2_Sales;
  
  SELECT
    soh.SalesOrderID,
    soh.OrderDate,
    soh.ShipDate,
    soh.Status,
    soh.TotalDue,
    sod.ProductID,
    p.Name AS ProductName,
    CAST
    (
      DecryptByKey (ecc.CreditCardNumber) AS nvarchar(100)
    ) AS CreditCardNumber,
    CAST
    (
      DecryptByKey (ecc.CreditCardExpirationDate) AS datetime
  ) AS CreditCardExp
  FROM SalesLT.SalesOrderHeader soh
  INNER JOIN SalesLT.SalesOrderDetail sod
    ON soh.SalesOrderID = sod.SalesOrderID
  INNER JOIN SalesLT.Product p
    ON sod.ProductID = p.ProductID
  INNER JOIN SalesLT.EncryptedCreditCardInfo ecc
    ON soh.SalesOrderID = ecc.SalesOrderID
  WHERE soh.SalesOrderID = @SalesOrderID;
  
  INSERT INTO SalesLT.DecryptCreditCardInfoLog
  (
    SalesOrderID,
    LogUser,
    LogDate
  )
  VALUES
  (
    @SalesOrderID,
    USER_NAME(),
    GETDATE()
  );
  
  CLOSE SYMMETRIC KEY SymKey7_Sales; 
END;
GO
