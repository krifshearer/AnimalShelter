/* What percent of adopters that adopt an animal with
"Good with Children" have children?*/

SELECT 
COUNT((CASE WHEN adoption_application.have_children = 1 THEN 1 END)) 
/
COUNT((CASE WHEN animal.good_with_children = 1 THEN 1 END)) * 100.0
FROM adoption_application
JOIN animal
ON adoption_application.animal_id = animal.id;