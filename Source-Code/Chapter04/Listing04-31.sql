-- Listing 4-31
-- Grant permissions to certificate user

GRANT CONTROL ON SYMMETRIC KEY::SymKey7_Sales
TO CCDecryptor;
GO

GRANT CONTROL ON CERTIFICATE::Cert2_Sales
TO CCDecryptor;
GO
