WITH course AS (
    SELECT
        *
    FROM
        {{ ref('dm__dim_course') }}
),
course_details AS (
    SELECT
        *
    FROM
        {{ ref('dm__dim_course_details') }}
),
teacher AS (
    SELECT
        *
    FROM
        {{ ref ('dm__dim_teacher') }}
)

SELECT
    grades.date,
    grades.id_course,
    course.course_name,
    course_details.id_teacher,
    teacher.teacher_name,
    ROUND(AVG(grade),2) AS grades_average
FROM
    {{ ref('stg__fact_grades') }} AS grades
LEFT JOIN
    course ON course.id_course = grades.id_course
LEFT JOIN
    course_details ON course_details.id_course = grades.id_course AND course_details.date = grades.date
LEFT JOIN
    teacher ON teacher.id_teacher = course_details.id_teacher
GROUP BY
    grades.date,
    grades.id_course,
    course.course_name,
    course_details.id_teacher,
    teacher.teacher_name
ORDER BY
    grades.date,
    course.course_name
