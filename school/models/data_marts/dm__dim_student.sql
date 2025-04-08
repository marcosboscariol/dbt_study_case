WITH source AS (
    SELECT
       *
    FROM
       {{ ref('stg__dim_student') }}
)
SELECT
    *
FROM
    source