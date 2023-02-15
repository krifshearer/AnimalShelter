/* Which (Animal Name) was the first aniaml inspected by
the newest vet? */

SELECT animal.name AS Animal_Name,
employee.job_title, employee.name, health_report.inspection_date
FROM health_report
JOIN employee
ON health_report.inspector = employee.id
JOIN animal 
ON animal.id = health_report.animal_id
WHERE employee.hire_date = (SELECT max(hire_date) FROM employee WHERE employee.job_title = 'Veterinarian')
ORDER BY health_report.inspection_date ASC
LIMIT 1;

