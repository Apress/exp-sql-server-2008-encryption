-- Listing 4-37
-- Create sample state table

USE AdventureWorksLT2008;
GO

CREATE TABLE dbo.State
(
  abbreviation nvarchar(2) not null primary key,
  name nvarchar(100) not null,
  capital nvarchar(100) not null,
  flag_graphic nvarchar(20) not null,
  entry_date date not null,
  fact nvarchar(2000) not null,
  capital_address nvarchar(50) not null,
  zip_code nvarchar(5) not null,
  longitude float not null,
  latitude float not null
);
GO
