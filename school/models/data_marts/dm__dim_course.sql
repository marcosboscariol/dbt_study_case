WITH source AS (
    SELECT
       *
    FROM
       {{ ref('stg__dim_course') }}
)
SELECT
    *
FROM
    source