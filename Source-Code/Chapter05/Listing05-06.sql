-- Listing 5-6
-- Verifying Asymmetric Key Creation Success

SELECT
  name,
  asymmetric_key_id,
  pvt_key_encryption_type_desc,
  algorithm_desc,
  key_length,
  provider_type
FROM sys.asymmetric_keys
WHERE pvt_key_encryption_type = N'CP';
