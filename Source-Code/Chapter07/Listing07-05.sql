-- Listing 7-5
-- User-Defined Function to Generate an Extended SHA-1 Hash

CREATE FUNCTION dbo.Sha1ExtendedHash (@input varchar(max))
RETURNS varbinary(20)
AS
BEGIN
  DECLARE
    @hashRegister1 varbinary(20) = NULL,
    @hashRegister2 varbinary(40) = NULL,
    @i int = 1;
  
  SELECT @hashRegister1 = HashBytes('SHA1', SUBSTRING(@input, @i, 8000));
  SET @i = @i + 8000;
  
  WHILE @i < DATALENGTH(@input)
  BEGIN
    SET @hashRegister2 = @hashRegister1 + 
      HashBytes ('SHA1', SUBSTRING(@input, @i, 8000));
    SET @hashRegister1 = HashBytes('SHA1', @hashRegister2);
    SET @i = @i + 8000;
  END;
  
  RETURN @hashRegister1;
END;
GO
