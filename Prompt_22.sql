/* Are the Animal Care Assistants paid well or not?
Google: Pay Range is between $13 to $19, with an avg of $16*/

SELECT '$13' AS BottomSalaryUSA, '$19' AS TopSalaryUSA, 
 '$16' AS AvgSalaryUSA, avg(employee_wage.current_salary)
 FROM employee
 JOIN employee_wage
 ON employee.id = employee_wage.employee_id
 WHERE employee.job_title = 'Animal Assistant '
 
 /* Yikes*/