-- Listing 2-14
-- Retrieve list of asymmetric keys from current database

SELECT 
  name,
  asymmetric_key_id,
  pvt_key_encryption_type_desc,
  thumbprint,
  algorithm_desc,
  key_length,
  public_key  	
FROM sys.asymmetric_keys;


