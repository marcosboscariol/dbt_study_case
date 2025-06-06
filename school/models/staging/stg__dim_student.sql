WITH source AS (
    SELECT
        *
    FROM
        {{ source ('school', 'raw__student') }}
)

SELECT
    id_student::VARCHAR,
    name::VARCHAR AS student_name
FROM
    source