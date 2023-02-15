/* Why does this day require less empployees in general? */

SELECT COUNT(*) AS EmployeesAtShelter, Date, dayofweek(Date)
FROM employee_schedule
GROUP BY date
ORDER BY COUNT(*) ASC;

/*Sundays and Satudays take the least amount of people to 
run because it's the weekend, and the weekend has limited
Open hours */
