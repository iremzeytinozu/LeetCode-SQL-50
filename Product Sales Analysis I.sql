-- Write your PostgreSQL query statement below
SELECT 
    P.product_name,
    S.year,
    S.price
FROM Sales AS S
INNER JOIN Product AS P ON S.product_id = P.product_id
