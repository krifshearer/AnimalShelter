/* Which day has the most visitors? */

SELECT Visit_date, COUNT(*) AS No_Visitors
FROM visitor
GROUP BY Visit_date
ORDER BY COUNT(*) DESC

