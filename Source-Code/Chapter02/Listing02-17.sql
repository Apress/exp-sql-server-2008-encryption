-- Listing 2-17
-- Retrieve list of registered cryptographic providers

SELECT 
  provider_id,
  name,
  guid,
  version,
  dll_path,
  is_enabled
FROM sys.cryptographic_providers;



