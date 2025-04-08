WITH source AS (
    SELECT
        *
    FROM
        {{ source('school', 'raw__teacher') }}
)

SELECT
    id_teacher::VARCHAR,
    name::VARCHAR AS teacher_name
FROM
    source