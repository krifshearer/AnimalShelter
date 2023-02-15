/* What percent of adopters applying for farm animals rent?*/

SELECT (COUNT(
(CASE 
WHEN adoption_application.rent_or_own = 'Rent' THEN 1
END)) / COUNT(*)) * 100.0
FROM adoption_application
JOIN animal
ON animal.id = adoption_application.animal_id
WHERE animal.type LIKE '%farm%';