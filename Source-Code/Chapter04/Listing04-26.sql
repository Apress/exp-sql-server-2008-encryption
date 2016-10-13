-- Listing 4-26
-- Querying product descriptions and signatures

SELECT
  pd.ProductDescriptionID,
  pd.Description,
  s.Signature
FROM SalesLT.ProductDescription pd
INNER JOIN SalesLT.ProductDecriptionSigs s
ON pd.ProductDescriptionID = s.ProductDescriptionID;
