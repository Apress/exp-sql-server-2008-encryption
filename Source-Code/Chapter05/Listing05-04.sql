-- Listing 5-4
-- Querying Catalog Views and DMVs to Validate EKM Rregistration

SELECT provider_id,
  name,
  guid,
  version,
  dll_path,
  is_enabled
FROM sys.cryptographic_providers;

SELECT
  credential_id,
  name,
  credential_identity,
  create_date,
  target_type,
  target_id
FROM sys.credentials;

SELECT 
  provider_id,
  guid,
  provider_version,
  sqlcrypt_version,
  friendly_name,
  authentication_type,
  symmetric_key_support,
  asymmetric_key_support
FROM sys.dm_cryptographic_provider_properties;
