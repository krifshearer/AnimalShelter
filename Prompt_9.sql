/*Roughly how much has the shelter collected in adoption
fees? */

SELECT COUNT(animal.type) * adoption_fees.cost
FROM animal
JOIN adoption_fees
ON animal.type = adoption_fees.animal_type
GROUP BY animal.type