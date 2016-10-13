-- Listing 6-9
-- Listing Encrypted Databases

SELECT
  DB_NAME(database_id) AS database_name,
  database_id,
  CASE encryption_state
    WHEN 0 THEN N'No database encryption key present, no encryption'
    WHEN 1 THEN N'Unencrypted'
    WHEN 2 THEN N'Encryption in progress'
    WHEN 3 THEN N'Encrypted'
    WHEN 4 THEN N'Key change in progress'
    WHEN 5 THEN N'Decryption in progress'
  END AS encryption_state,
  key_algorithm,
  key_length,
  percent_complete  
FROM sys.dm_database_encryption_keys;
