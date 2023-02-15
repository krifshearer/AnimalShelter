/* How often do employees get raises? Should be the same 
for every employee */

SELECT DATEDIFF(next_raise, last_raise) / 30
FROM employee_wage

/* 9 months */