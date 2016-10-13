-- Listing 7-10
-- Two-Character Collisions with CHECKSUM

SELECT 
  'LE' AS String,
  CHECKSUM('LE') AS CheckSumHash

UNION ALL

SELECT
  'MU',
  CHECKSUM('MU');
