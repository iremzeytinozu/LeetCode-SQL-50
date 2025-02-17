-- Write your PostgreSQL query statement below
SELECT 
    W1.id
FROM Weather AS W1 -- bugünü tutacak
JOIN Weather AS W2 ON W1.recordDate = W2.recordDate + INTERVAL '1 day' -- bir öneki günün verileri temsil eder
WHERE W1.temperature > w2.temperature