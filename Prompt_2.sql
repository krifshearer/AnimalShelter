/* What is the average age dogs that have come to the shelter?
*/

SELECT SUM(Age_Years) / COUNT(Age_Years)
FROM animal
WHERE type IN ('Dog (Adult)','Dog (Puppy)');
