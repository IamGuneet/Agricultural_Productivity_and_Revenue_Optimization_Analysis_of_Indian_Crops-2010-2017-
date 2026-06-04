sql
WITH ranked_tmp AS (
  SELECT e.name, e.salary, d.department_name,
    DENSE_RANK() OVER (PARTITION BY e.department_id 
                       ORDER BY salary DESC) as salary_rank
  FROM employee e
  JOIN department d ON e.department_id = d.department_id
)
SELECT * FROM ranked_tmp
WHERE salary_rank IN (1,2,3)
ORDER BY department_name ASC, salary DESC, name ASC;

