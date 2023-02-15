/*A owner lost their animal and has a general description of the animal, can you help them find it?
Email: 
 Hello. Recently I lost my precious baby! I'm contacting all local shelters regarding my love, Juno! 
 He's a Beagle-Hound Mix and white as a sheet! He's getting old but he really is quite spry,
 he loves socializing and he got lost not too long ago. Please tell me if you have a dog like that!
 I miss my baby ☹
-	April Daisy */

SELECT *
FROM animal
WHERE name LIKE '%Juno%'
AND Breed IN ('Beagle' , 'Hound' , 'Mix');