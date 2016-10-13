-- Listing 2-20
-- Retrieve algorithms supported by cryptographic provider

SELECT
  algorithm_id,
  algorithm_tag,
  key_type,
  key_length
FROM sys.dm_cryptographic_provider_algorithms (65536); -- replace 65536 with your own cryptographic provider ID

