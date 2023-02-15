/* Which adopter has the most adoptions? */

SELECT COUNT(*)
FROM adoption
GROUP BY Adopter_ID
ORDER BY COUNT(*) DESC;