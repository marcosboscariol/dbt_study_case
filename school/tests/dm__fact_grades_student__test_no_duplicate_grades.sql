SELECT
    id_student, 
    id_course, 
    date, 
    COUNT(*) as count
FROM 
    {{ ref('dm__fact_grades_student') }}
GROUP BY 
    1, 2, 3
HAVING 
    COUNT(*) > 1
