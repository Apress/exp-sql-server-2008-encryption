-- Listing 3-19
-- Encrypting/decrypting data by passphrase

-- Define the plaintext
DECLARE @plaintext nvarchar(100) = N'Four score and seven years ago our 
fathers brought forth, upon this continent, a new nation...';

-- Encrypt the data with a passphrase
DECLARE @encryptedtext varbinary(300);

SET @encryptedtext = EncryptByPassPhrase(N'Quick brown fox', @plaintext);

-- Decrypt the data with the same passphrase
SELECT CAST
  (
    DecryptByPassPhrase(N'Quick brown fox', @encryptedtext) AS nvarchar(100)
  ) AS DecryptedData;
GO
