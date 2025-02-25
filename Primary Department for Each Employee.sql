-- Write your PostgreSQL query statement below
WITH T1 AS (
            SELECT
                employee_id, 
                COUNT(department_id) AS number_department -- eger 1 cikarsa zaten kendi departmanini getiriyor
            FROM Employee
            GROUP BY 1
)

SELECT 
    T2.employee_id,
    department_id
FROM Employee AS T2
INNER JOIN T1 
ON T2.employee_id = T1.employee_id
AND(primary_flag = 'Y' OR number_department = 1) 