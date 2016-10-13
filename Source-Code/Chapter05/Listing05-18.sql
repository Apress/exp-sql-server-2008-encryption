-- Listing 5-18
-- Querying the list of cryptographic provider algorithms

SELECT 
  algorithm_id,
  algorithm_tag,
  key_type,
  key_length
FROM sys.dm_cryptographic_provider_algorithms (65535);
