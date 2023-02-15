/* When percent of adopters applying for dogs
(Adult and puppy) have yards? */

SELECT (COUNT(
(CASE WHEN adoption_application.have_yard = 1 THEN 1
END)) / COUNT(*) * 100.0)
FROM adoption_application
LEFT JOIN animal
ON animal.id = adoption_application.animal_id
WHERE animal.type IN ('Dog (Adult)' , 'Dog (Puppy)');
