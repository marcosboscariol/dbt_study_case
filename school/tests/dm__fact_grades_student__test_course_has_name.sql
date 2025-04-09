SELECT
    *
FROM 
    {{ ref('dm__fact_grades_student') }}
WHERE 
    course_name IS NULL