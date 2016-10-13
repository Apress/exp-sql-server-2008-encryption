-- Listing 7-3
-- Hashing the Same String As varchar and nvarchar

SELECT 
  'varchar' AS Type, 
  HashBytes('SHA1', 'Albert Einstein') AS HashValue

UNION ALL

SELECT 
  'nvarchar', 
  HashBytes('SHA1', N'Albert Einstein');
