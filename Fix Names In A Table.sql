-- Write your PostgreSQL query statement below
SELECT 
    user_id,
    UPPER(SUBSTRING(name FROM 1 FOR 1))  -- stringin ilk karakterini alir
    || LOWER(SUBSTRING(name FROM 2)) AS name -- ikinci karakterden son karaktere kadar alir
FROM Users 
ORDER BY 1