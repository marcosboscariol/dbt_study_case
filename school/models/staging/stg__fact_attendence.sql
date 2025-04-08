WITH source AS (
    SELECT
        *
    FROM
        {{ source('school', 'raw__attendence') }}
)

SELECT
    date::DATE,
    id_student::VARCHAR,
    id_course::VARCHAR,
    abscence::INT
FROM
    source