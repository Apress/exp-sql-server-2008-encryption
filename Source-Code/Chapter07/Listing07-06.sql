-- Listing 7-6
-- Testing the Extended Hash Function

DECLARE 
  @string8000 varchar(max) = CAST(REPLICATE('A', 8000) AS varchar(max)),
  @string9000 varchar(max) = CAST(REPLICATE('A', 8000) AS varchar(max)) + REPLICATE('Z', 1000);

SELECT 
  '8,000 bytes, normal' AS Length, 
  HashBytes('SHA1', @string8000) AS HashValue

UNION ALL

SELECT
  '8,000 bytes, extended', 
  dbo.Sha1ExtendedHash(@string8000)

UNION ALL

SELECT 
  '9,000 bytes, extended', 
  dbo.Sha1ExtendedHash(@string9000);
