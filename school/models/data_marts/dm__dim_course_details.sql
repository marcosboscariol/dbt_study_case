WITH source AS (
    SELECT
       *
    FROM
       {{ ref('stg__dim_course_details') }}
)
SELECT
    *
FROM
    source