-- Listing 2-19
-- Retrieve symmetric keys that are encrypted by certificate

SELECT 
  sk.name AS key_name,
  ke.crypt_type_desc,
  ke.crypt_property,
  c.name AS cert_name,
  sk.algorithm_desc AS key_algorithm_desc,
  sk.key_length,
  ke.thumbprint
FROM sys.key_encryptions ke
INNER JOIN sys.symmetric_keys sk
  ON sk.symmetric_key_id = ke.key_id
INNER JOIN sys.certificates c
  ON ke.thumbprint = c.thumbprint;
