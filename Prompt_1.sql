/* What is the average age of an available cat within the 
shelter*/

SELECT Avg(Age_Years)
FROM animal
WHERE type = 'Cat'
AND Adoption_Status = 'Available';