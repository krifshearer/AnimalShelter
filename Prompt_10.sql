/* What day of the week has the most visitors on average?) */

SELECT dayofweek(visit_date), count(visit_date)
FROM visitor
GROUP BY dayofweek(visit_date);

/* 1 = Sunday, so 6 = Friday
Friday is the most common day for visitors followed by 
Saturday and Tuesday */