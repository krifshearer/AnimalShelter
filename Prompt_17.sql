/* Which department has the most employees currently? */

SELECT dept_id, COUNT(*)
FROM employee
GROUP BY dept_id
ORDER BY count(*) desc;