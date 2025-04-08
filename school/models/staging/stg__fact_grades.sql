WITH source AS (
    SELECT
        *
    FROM
        {{ source('school', 'raw__grades') }}
)

SELECT
    date::DATE,
    id_course::VARCHAR,
    id_student::VARCHAR,
    grade::NUMERIC
FROM
    source