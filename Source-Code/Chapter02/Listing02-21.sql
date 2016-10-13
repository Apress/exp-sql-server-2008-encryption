-- Listing 2-21
-- Retrieve keys exposed by cryptographic provider

SELECT
  key_id,
  key_name,
  algorithm_tag,
  key_type,
  key_length,
  key_thumbprint
FROM sys.dm_cryptographic_provider_keys (65536); -- replace 65536 with your own cryptographic provider ID

