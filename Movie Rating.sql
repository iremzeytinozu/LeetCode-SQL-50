-- Write your PostgreSQL query statement below
(SELECT name AS results
FROM MovieRating AS mr
JOIN Users AS u
USING (user_id) -- ON mr.user_id = u.user_id
GROUP BY u.name
ORDER BY COUNT(*) DESC, u.name
LIMIT 1)

UNION ALL

(SELECT m.title AS results
FROM MovieRating AS mr
JOIN Movies AS m 
USING(movie_id)
WHERE TO_CHAR(mr.created_at, 'YYYY-MM') = '2020-02'
GROUP BY m.title
ORDER BY AVG(mr.rating) DESC, m.title
LIMIT 1);

