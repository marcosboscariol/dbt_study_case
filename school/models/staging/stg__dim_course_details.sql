WITH source AS (
    SELECT
        *
    FROM
        {{ source ('school', 'raw__course_details') }}
)

SELECT
    date::DATE,
    id_course::VARCHAR,
    id_teacher::VARCHAR,
    minimum_grade::NUMERIC AS minimum_grade
FROM
    source