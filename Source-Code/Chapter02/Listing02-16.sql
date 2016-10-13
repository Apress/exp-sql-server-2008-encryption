-- Listing 2-16
-- Retrieve list of EKM provider credentials

SELECT 
  credential_id,
  name,
  credential_identity,
  create_date,
  modify_date,
  target_type,
  target_id
FROM sys.credentials;


