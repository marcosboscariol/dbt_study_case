WITH source AS (
    SELECT
        *
    FROM
        {{ source('school', 'raw__course') }}
)

SELECT
    id_course,
    course_name
FROM source