-- Listing 2-3
-- Change SMK account

ALTER SERVICE MASTER KEY 
WITH NEW_ACCOUNT = N'SQL2008Server\Michael',  -- Replace account name with your service account name
  NEW_PASSWORD = N'^&3h4l1xPr';

