-- Listing 2-18
-- Retrieve cryptographic properties

SELECT
  o.name AS object_name,
  SCHEMA_NAME(o.schema_id) AS object_schema,
  cp.major_id,
  cp.class_desc,
  cp.crypt_type_desc,
  cp.thumbprint
FROM sys.crypt_properties cp
INNER JOIN sys.all_objects o
  ON cp.major_id = o.object_id;
