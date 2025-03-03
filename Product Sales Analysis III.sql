-- Write your PostgreSQL query statement below
WITH Temp AS (SELECT 
                product_id,
                MIN(year) AS first_year
            FROM Sales 
            GROUP BY 1
            )

SELECT
    S.product_id,
    S.year AS first_year,
    S.quantity,
    S.price
FROM Sales AS S
WHERE (S.product_id, S.year) IN (SELECT product_id, first_year FROM Temp)