-- Listing 7-4
-- Comparing SHA-1 Hashes of an 8,000 Byte String and a 9,000 Byte String

DECLARE 
  @string8000 varchar(max) = REPLICATE('A', 8000),
  @string9000 varchar(max) = REPLICATE('A', 8000) + REPLICATE('Z', 1000);

SELECT 
  '8,000 bytes' AS Length, 
  HashBytes('SHA1', @string8000) AS HashValue
UNION ALL
SELECT 
  '9,000 bytes', 
  HashBytes('SHA1', @string9000);
