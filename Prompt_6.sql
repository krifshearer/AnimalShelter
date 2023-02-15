/* What is the general application acceptance rate? */

SELECT (SUM(
(CASE WHEN Status = 'Accepted' THEN 1
ELSE 0 END)) /COUNT(*) * 100.0)
FROM adoption_application