/* Which Month has the most intakes? */

SELECT MONTH(intake_date), COUNT(intake_date)
FROM animal
GROUP BY MONTH(intake_date)
ORDER BY COUNT(intake_date) DESC;

/* December is the highest month! And Janurary is second
highest. The holiday season :( */

