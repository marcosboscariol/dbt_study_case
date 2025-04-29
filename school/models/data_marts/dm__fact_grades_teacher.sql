WITH course_details AS (
    SELECT *
    FROM {{ ref('dm__dim_course_details') }}
),

grades AS (
    SELECT *
    FROM {{ ref('stg__fact_grades') }}
),

matched_grades AS (
    SELECT
        grades.date,
        grades.grade,
        course_details.surrogate_key AS sk_course_details,
        course_details.id_teacher,
        course_details.id_course 
    FROM 
        grades
    LEFT JOIN 
        course_details
        ON course_details.id_course = grades.id_course
        AND grades.date >= course_details.valid_from
        AND (grades.date < course_details.valid_to OR course_details.valid_to IS NULL)
)

SELECT
    date,
    id_course,
    id_teacher,
    sk_course_details,
    ROUND(AVG(grade), 2) AS grades_average
FROM 
    matched_grades
GROUP BY
    date,
    id_course,
    id_teacher,
    sk_course_details
ORDER BY
    date
