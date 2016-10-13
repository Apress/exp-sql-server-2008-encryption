-- Listing 5-14
-- Querying sys.symmetric_keys to Verify Key Creation

SELECT
  name,
  symmetric_key_id,
  key_length,
  algorithm_desc,
  provider_type
FROM sys.symmetric_keys
WHERE provider_type = N'CRYPTOGRAPHIC PROVIDER';

