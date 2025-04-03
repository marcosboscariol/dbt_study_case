WITH source AS (
    SELECT
        *
    FROM
        {{ source ('school', 'raw__student') }}
)

SELECT
    id_student,
    name AS student_name
FROM
    source