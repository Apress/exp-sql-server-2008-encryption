-- Listing 5-8
-- Verifying Symmetric Key Protection by an HSM Asymmetric Key

SELECT
  sk.name AS sym_name,
  sk.symmetric_key_id AS sym_id,
  sk.key_length AS sym_len,
  sk.algorithm_desc AS sym_algo,
  ke.crypt_type_desc AS sym_crypt_type,
  ak.name AS asym_key_name,
  ak.algorithm_desc As asym_algo,
  ak.key_length AS asym_len,
  ak.provider_type AS asym_key_provider
FROM sys.symmetric_keys sk
INNER JOIN sys.key_encryptions ke
  ON sk.symmetric_key_id = ke.key_id
INNER JOIN sys.asymmetric_keys ak
  ON ke.thumbprint = ak.thumbprint
WHERE ak.pvt_key_encryption_type = N'CP';
