-- Write your PostgreSQL query statement below
SELECT 
    E1.employee_id,
    E1.name,
    COUNT(E2.reports_to) AS reports_count,
    ROUND(AVG(E2.age)) AS average_age
FROM Employees AS E1
JOIN Employees AS E2
ON E1.employee_id = E2.reports_to
GROUP BY 1, 2
ORDER BY 1