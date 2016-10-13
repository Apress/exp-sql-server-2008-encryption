-- Listing 2-23
-- Enumerate all open cryptographic provider session

SELECT
  provider_id,
  session_handle,
  [identity],
  spid
FROM sys.dm_cryptographic_provider_sessions(1);
