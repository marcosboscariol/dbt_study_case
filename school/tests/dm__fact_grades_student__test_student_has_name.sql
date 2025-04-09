SELECT
    *
FROM 
    {{ ref('dm__fact_grades_student') }}
WHERE 
    student_name IS NULL
