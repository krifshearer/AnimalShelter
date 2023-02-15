/* How long has the average fostered animal been "with"
the shelter? */

SELECT Avg(DATEDIFF(intake_date,'2022-02-09'))
FROM animal
WHERE adoption_status = 'Fostered';