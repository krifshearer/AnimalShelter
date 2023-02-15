/* Which time (hours) are visitos most likely to come?*/

SELECT HOUR(visit_time) AS Time, COUNT(*) AS No_Visitors
 FROM visitor
 GROUP BY Time
 ORDER BY COUNT(*) DESC

/* 1pm! */

