-- Listing 4-41
-- Create and sign LoadStates procedure

-- Now create the LoadStates procedure to bulk load an XML file
-- and shred into a relational table
CREATE PROCEDURE dbo.LoadStates
AS
BEGIN
  DECLARE @x xml;

  EXEC dbo.sp_executesql N'SELECT @x = BulkColumn 
    FROM OPENROWSET
    (
      BULK N''c:\state-list.xml'', SINGLE_BLOB
    ) AS x;',
    N'@x xml OUTPUT', 
    @x = @x OUTPUT;

  INSERT INTO dbo.State
  (
    abbreviation,
    name,
    capital,
    flag_graphic,
    entry_date,
    fact,
    capital_address,
    zip_code,
    longitude,
    latitude
  )
  SELECT c.value(N'@abbreviation[1]', N'nvarchar(2)'),
    c.value(N'@name[1]', N'nvarchar(100)'),
    c.value(N'@capital[1]', N'nvarchar(100)'),
    c.value(N'@flag[1]', N'nvarchar(20)'),
    c.value(N'@date[1]', N'date'),
    c.value(N'@fact[1]', N'nvarchar(2000)'),
    c.value(N'@address[1]', N'nvarchar(50)'),
    c.value(N'@zip[1]', N'nvarchar(5)'),
    c.value(N'@long[1]', N'float'),
    c.value(N'@lat[1]', N'float')
  FROM @x.nodes(N'//state') t(c);
END;
GO

-- Sign the test procedure with the certificate
ADD SIGNATURE TO LoadStates
BY CERTIFICATE LoadStates_Cert
WITH PASSWORD = N'l0a8p3rm$';
GO
