-- Listing 9-6
-- Create Nonclustered Index on Last Four Digits of Credit Card Column

CREATE NONCLUSTERED INDEX IX_EncryptedCreditCardInfo
ON SalesLT.EncryptedCreditCardInfo 
  (
    CreditCardLast4, 
    CreditCardNumber
  )
WITH (DROP_EXISTING = ON);
