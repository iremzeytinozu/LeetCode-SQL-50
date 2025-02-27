-- Write your PostgreSQL query statement below
SELECT 
    S.student_id,
    S.student_name,
    S2.subject_name,
    COUNT(E.student_id) AS attended_exams
FROM Students AS S
CROSS JOIN Subjects AS S2
LEFT JOIN Examinations AS E
ON S.student_id = E.student_id
AND S2.subject_name = E.subject_name
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3
