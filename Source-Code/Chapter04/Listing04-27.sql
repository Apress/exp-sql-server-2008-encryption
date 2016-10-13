-- Listing 4-27
-- Verifying certificate signatures

SELECT
  pd.ProductDescriptionID,
  pd.Description,
  s.Signature,
  VerifySignedByCert
  (
    Cert_ID(N'Cert1_Sales'), pd.Description, s.Signature
  ) AS Verified
FROM SalesLT.ProductDescription pd
INNER JOIN SalesLT.ProductDecriptionSigs s
ON pd.ProductDescriptionID = s.ProductDescriptionID;

