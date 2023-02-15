/* What percent of adopters adopt an animal with "Good with 
Animals" don't have animals? */

SELECT SUM(
(CASE WHEN adoption_application.have_animals = 0 THEN 1 
WHEN adoption_application.have_animals IS NULL THEN 0
WHEN adoption_application.have_animals = 1 THEN 0 END)) 
/ 
COUNT(
(CASE WHEN animal.good_with_animals = 1 THEN 1 END)) * 100.0
AS GoodWithAnimalsButNoneInHome
FROM adoption_application
JOIN animal
ON adoption_application.animal_id = animal.id