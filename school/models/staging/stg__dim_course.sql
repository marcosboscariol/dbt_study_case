WITH source AS (
    SELECT
        *
    FROM
        {{ source('school', 'raw__course') }}
)

SELECT
    id_course::VARCHAR,
    course_name::VARCHAR
FROM source