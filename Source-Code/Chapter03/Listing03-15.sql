-- Listing 3-15
-- Turning "automatic key management" back on

-- Open the DMK
OPEN MASTER KEY 
DECRYPTION BY PASSWORD = 'a0*Ui)4x-f';
GO

-- Add encryption by SMK
ALTER MASTER KEY
ADD ENCRYPTION BY SERVICE MASTER KEY;
GO

-- Close the DMK
CLOSE MASTER KEY;
GO

