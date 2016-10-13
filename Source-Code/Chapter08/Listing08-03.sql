-- Listing 8-3
-- Encrypt/decrypt a BLOB

-- Generate a 20,000 byte (10 chars X 2000 = 20,000 chars) character string
DECLARE @plaintext varchar(max);
SET @plaintext = REPLICATE(CAST('ABCDEFGHIJ' AS varchar(max)), 2000);

-- Encrypt the BLOB
DECLARE @encrypted varbinary(max);
SET @encrypted = dbo.EncryptAesByPassPhrase
  (
    'This is my passphrase',
    CAST(@plaintext AS varbinary(max)),
    1,
    'This is my authenticator'
  );
  
-- Decrypt the BLOB
DECLARE @decrypted varbinary(max);
SET @decrypted = dbo.DecryptAesByPassPhrase
  (
    'This is my passphrase',
    @encrypted,
    1,
    'This is my authenticator'
  );

-- Compare decrypted string and plaintext lengths
SELECT 
  DATALENGTH(@decrypted) AS decrypted_len, 
  DATALENGTH(@plaintext) AS plaintext_len;

-- Compare decrypted string and plaintext contents
SELECT
  CASE WHEN @decrypted = @plaintext
       THEN 'Decrypted value is equal to plaintext'
       ELSE 'Decrypted value is not equal to plaintext'
       END AS equal;
