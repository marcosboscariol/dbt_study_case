WITH source AS (
    SELECT
        *
    FROM
        {{ source('school', 'raw__grades') }}
)

SELECT
    date,
    id_course,
    id_student,
    grade
FROM
    source