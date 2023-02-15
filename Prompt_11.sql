/* How many more or less Adult Dogs are House Trained
than Puppies? */

SELECT 
COUNT(CASE WHEN animal.type = "Dog (Adult)" THEN 1 END) 
-
COUNT(CASE WHEN animal.type = "Dog (Puppy)" THEN 1 END)
AS DifferenceBetweenHousetrainedDogsVSPuppies
FROM animal
WHERE House_trained = 1;