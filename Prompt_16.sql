/* What are the full names of the employees that 
cleaned the cage on the current date (Feb 9th, 2023)?*/

SELECT DISTINCT employee.name
FROM cage_cleaning
JOIN employee
on employee.id = cage_cleaning.employee_id
WHERE Date = '2023-02-09';