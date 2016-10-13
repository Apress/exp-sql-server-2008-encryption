-- Listing 8-7
-- Generating Salted Hashes

-- Generate a 20,000 byte (10 chars X 2000) character string
DECLARE @plaintext varchar(max);
SET @plaintext = REPLICATE(CAST('ABCDEFGHIJ' AS varchar(max)), 2000);

DECLARE @salt varbinary(16);
SET @salt = Crypt_Gen_Random(16);

DECLARE
  @sha256 varbinary(32),
  @sha384 varbinary(48),
  @sha512 varbinary(64);
  
SELECT
  @sha256 = dbo.SaltedHash('SHA256', CAST(@plaintext AS varbinary(max)), @salt),
  @sha384 = dbo.SaltedHash('SHA384', CAST(@plaintext AS varbinary(max)), @salt),
  @sha512 = dbo.SaltedHash('SHA512', CAST(@plaintext AS varbinary(max)), @salt);

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

