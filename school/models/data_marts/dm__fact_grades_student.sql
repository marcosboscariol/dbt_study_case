WITH course AS (
    SELECT
        *
    FROM
        {{ ref('dm__dim_course') }}
),

student AS (
    SELECT
        *
    FROM
        {{ ref('dm__dim_student') }}
)

SELECT
    grades.date,
    grades.id_course,
    course.course_name,
    grades.id_student,
    student.student_name,
    grade
FROM
    {{ ref('stg__fact_grades') }} AS grades
LEFT JOIN
    course ON course.id_course = grades.id_course
LEFT JOIN
    student ON student.id_student = grades.id_student