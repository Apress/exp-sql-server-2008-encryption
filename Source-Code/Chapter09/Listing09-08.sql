-- Listing 9-8
-- Adding a Cryptographic Hash of the Plaintext Credit Card Number

-- Drop nonclustered index
DROP INDEX IX_EncryptedCreditCardInfo
ON SalesLT.EncryptedCreditCardInfo;
GO

-- Drop credit card last 4 digits column
ALTER TABLE SalesLT.EncryptedCreditCardInfo
DROP COLUMN CreditCardLast4;
GO

-- Add a credit card hash column
ALTER TABLE SalesLT.EncryptedCreditCardInfo
ADD CreditCardHash varbinary(64);
GO

-- Populate the credit card hash
OPEN SYMMETRIC KEY SymKey6_Sales
DECRYPTION BY ASYMMETRIC KEY AsymKey1_Sales;

UPDATE SalesLT.EncryptedCreditCardInfo
SET CreditCardHash = HashBytes
  (
    'SHA1',
    CAST(DecryptByKey(CreditCardNumber) AS nvarchar(50))
  );

CLOSE SYMMETRIC KEY SymKey6_Sales;
GO

-- Recreate nonclustered index
CREATE NONCLUSTERED INDEX IX_EncryptedCreditCardInfo
ON SalesLT.EncryptedCreditCardInfo 
  (
    CreditCardHash, 
    CreditCardNumber
  );
