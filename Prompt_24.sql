/* Average start for each shift at shelter */

SELECT avg(employee.hire_date)
FROM employee_schedule
JOIN employee
ON employee.id = employee_schedule.employee_id
GROUP BY employee_schedule.start_time;