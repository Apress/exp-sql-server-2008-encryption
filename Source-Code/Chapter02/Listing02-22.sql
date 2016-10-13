-- Listing 2-22
-- Retrieve properties and feature support flags of EKM provider

SELECT
  provider_id,
  provider_version,
  sqlcrypt_version,
  friendly_name,
  authentication_type,
  symmetric_key_support,
  asymmetric_key_support  
FROM sys.dm_cryptographic_provider_properties;

