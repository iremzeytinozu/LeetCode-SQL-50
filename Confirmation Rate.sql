-- Write your PostgreSQL query statement below
SELECT 
    S.user_id,
    ROUND(AVG( -- tüm onayları bulup tüm actionlara bölüyoruz
                CASE 
                    WHEN c.action = 'confirmed' THEN 1.00
                ELSE 0
                END), 2) AS confirmation_rate
FROM Signups AS S
-- birleştirilen tabloda eşleşen kayıtlar varsa getir, yoksa NULL ile tamamla.
LEFT JOIN Confirmations AS C 
ON S.user_id = C.user_id
GROUP BY S.user_id