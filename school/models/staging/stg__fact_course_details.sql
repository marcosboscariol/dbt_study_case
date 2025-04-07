WITH source AS (
    SELECT
        *
    FROM
        {{ source ('school', 'raw__course_details') }}
)

SELECT
    date,
    id_course,
    id_teacher,
    minimum_grade::numeric AS minimum_grade
FROM
    source