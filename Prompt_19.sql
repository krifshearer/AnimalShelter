/* Whats is the minimum number of employees needed to
run the animal shelter */

SELECT COUNT(*) AS EmployeesAtShelter
FROM employee_schedule
GROUP BY date
ORDER BY COUNT(*) ASC;
