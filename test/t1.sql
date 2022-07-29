--1.	Find duplicate records in RPM_FUTURE_RETAIL. The record is a duplicate if there already such item/location/action_date combination exists (prices can differ):
--a.	Write a query to return all duplicated records. 
--b.	Delete duplicate records, so that item/location/action_date will be unique.
--


  SELECT  *
FROM    (
        SELECT  a.*, ROW_NUMBER() OVER (PARTITION BY ITEM ,LOCATION, ACTION_DATE ORDER BY FUTURE_RETAIL_ID) AS row_num
        FROM    RPM_FUTURE_RETAIL a
        )
WHERE   row_num > 1;

DELETE FROM RPM_FUTURE_RETAIL
WHERE FUTURE_RETAIL_ID IN ( SELECT  FUTURE_RETAIL_ID
FROM    (
        SELECT  a.*, ROW_NUMBER() OVER (PARTITION BY ITEM ,LOCATION, ACTION_DATE ORDER BY FUTURE_RETAIL_ID) AS row_num
        FROM    RPM_FUTURE_RETAIL a
        )
WHERE   row_num > 1)

  