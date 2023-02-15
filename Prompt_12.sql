/* Do animals with spceial needs take longer to get adopted?*/

SELECT animal.special_needs, AVG((DATEDIFF(adoption.adoption_date, animal.intake_date))) AS DaysInShelter
FROM adoption
JOIN animal
ON adoption.animal_id = animal.id
GROUP BY animal.special_needs
