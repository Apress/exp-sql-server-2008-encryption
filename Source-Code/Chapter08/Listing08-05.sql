-- Listing 8-5
-- Hash a BLOB

-- Generate a 20,000 byte (10 chars X 2000) character string
DECLARE @plaintext varchar(max);
SET @plaintext = REPLICATE(CAST('ABCDEFGHIJ' AS varchar(max)), 2000);

-- Generate hash values using all three algorithms
DECLARE
  @sha256 varbinary(32),
  @sha384 varbinary(48),
  @sha512 varbinary(64);

SELECT
  @sha256 = dbo.GetHash('SHA256', CAST(@plaintext AS varbinary(max))),
  @sha384 = dbo.GetHash('SHA384', CAST(@plaintext AS varbinary(max))),
  @sha512 = dbo.GetHash('SHA512', CAST(@plaintext AS varbinary(max)));

-- Show results
SELECT 
  'SHA-256' AS algorithm,
  @sha256 AS hash

UNION ALL

SELECT 
  'SHA-384',
  @sha384

UNION ALL

SELECT 
  'SHA-512',
  @sha512;
