SELECT * FROM (SELECT ITEM, ZONE, MAX(ACTION_DATE) FROM RPM_ZONE_FUTURE_RETAIL 
                WHERE ZONE = 1
                GROUP BY ITEM, ZONE) s1
JOIN (SELECT ITEM, ZONE, MAX(ACTION_DATE) FROM RPM_ZONE_FUTURE_RETAIL 
                WHERE ZONE = 2
                GROUP BY ITEM, ZONE) s2
ON s1.ITEM = s2.ITEM 
