--Write a query that will return currentand previous selling retail prices (preceding action_date) 
--for each item/location combinationand the difference between current and previous prices. 

SELECT fr.ITEM,fr.LOCATION,fr.ACTION_DATE,fr.SELLING_RETAIL,
	   LAG (fr.SELLING_RETAIL) OVER (PARTITION BY fr.ITEM,fr.LOCATION ORDER BY fr.ACTION_DATE, fr.SELLING_RETAIL) AS prev_price,
     (fr.SELLING_RETAIL - LAG (fr.SELLING_RETAIL) OVER (PARTITION BY fr.ITEM,fr.LOCATION ORDER BY fr.ACTION_DATE, fr.SELLING_RETAIL)) AS DIFF
     FROM RPM_FUTURE_RETAIL fr
     