WITH source AS (
    SELECT
        *
    FROM
        {{ source('school', 'raw__attendence') }}
)

SELECT
    date,
    id_student,
    id_course,
    abscence
FROM
    source