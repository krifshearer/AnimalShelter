/* Display the number of employee birthdays every month */

SELECT MONTH(birth_date) AS Month,  COUNT(birth_date)
FROM employee
GROUP BY Month
ORDER BY Month ASC;
