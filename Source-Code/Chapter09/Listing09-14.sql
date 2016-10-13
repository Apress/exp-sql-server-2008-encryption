-- Listing 9-14
-- Populating the Sample Table with HMACs

-- Populate the credit card hash
OPEN SYMMETRIC KEY SymKey6_Sales
DECRYPTION BY ASYMMETRIC KEY AsymKey1_Sales;

UPDATE SalesLT.EncryptedCreditCardInfo
SET CreditCardHash = dbo.GetHmac
  (
    'SHA256',
    DecryptByKey(CreditCardNumber),
    0x359a82109cfe
  );

CLOSE SYMMETRIC KEY SymKey6_Sales;
GO
