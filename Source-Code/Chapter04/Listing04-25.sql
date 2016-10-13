-- Listing 4-25
-- Signing data with a certificate

CREATE TABLE SalesLT.ProductDecriptionSigs
(
  ProductDescriptionID int not null primary key,
  Signature varbinary(256)
);
GO

INSERT INTO SalesLT.ProductDecriptionSigs
(
  ProductDescriptionID,
  Signature
)
SELECT
  ProductDescriptionID,
  SignByCert(Cert_ID(N'Cert1_Sales'), Description)
FROM SalesLT.ProductDescription;
GO

