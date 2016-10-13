-- Listing 2-24
-- Enumerate database encryption keys

SELECT
  d.name AS db_name,
  dbek.encryption_state,
  dbek.key_algorithm,
  dbek.key_length,
  dbek.percent_complete
FROM sys.dm_database_encryption_keys dbek
INNER JOIN sys.databases d
  ON dbek.database_id = d.database_id;

