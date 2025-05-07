-- Write your PostgreSQL query statement below
WITH 
daily_amount AS --
(
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on
),
moving_avg AS -- kendinden önceki 6 günle ortalamayı bul
(
    SELECT
        d1.visited_on,
        SUM(d2.amount) AS amount,
        ROUND(SUM(d2.amount) / 7.0, 2) AS average_amount
    FROM daily_amount d1
    JOIN daily_amount d2
      ON d2.visited_on BETWEEN d1.visited_on - INTERVAL '6 day' AND d1.visited_on
    GROUP BY d1.visited_on
)

SELECT *
FROM moving_avg
WHERE visited_on >= (
    SELECT MIN(visited_on) + INTERVAL '6 days' FROM daily_amount
)
ORDER BY visited_on;
