-- Listing 9-3
-- Create a Nonclustered Index on the CreditCardNumber Column

CREATE NONCLUSTERED INDEX IX_EncryptedCreditCardInfo
ON SalesLT.EncryptedCreditCardInfo 
  (
    CreditCardNumber
  );
