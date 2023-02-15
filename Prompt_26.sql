SELECT employee.name, COUNT(health_report.animal_id) AS
inspected_animals, Month(inspection_date)
FROM health_report
JOIN employee
ON employee.id = health_report.inspector
WHERE Month(inspection_date) = 8
AND Year(inspection_date) = 2022
GROUP BY employee.name, Month( Inspection_date)
ORDER BY inspected_animals DESC;
