-- Listing 2-15
-- Retrieve list of certificates from current database

SELECT
  name,
  certificate_id,
  pvt_key_encryption_type_desc,
  subject,
  cert_serial_number,
  start_date,
  expiry_date,
  thumbprint
FROM sys.certificates;


