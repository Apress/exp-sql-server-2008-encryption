-- Listing 9-4
-- Adding a Column to Hold the Credit Card Number Last Four Digits

ALTER TABLE SalesLT.EncryptedCreditCardInfo
ADD CreditCardLast4 nvarchar(4);
GO

OPEN SYMMETRIC KEY SymKey6_Sales
DECRYPTION BY ASYMMETRIC KEY AsymKey1_Sales;

UPDATE SalesLT.EncryptedCreditCardInfo
SET CreditCardLast4 = RIGHT
  (
    CAST
      (
        DecryptByKey(CreditCardNumber) AS nvarchar(50)
      ), 4
  );

CLOSE SYMMETRIC KEY SymKey6_Sales;
GO
