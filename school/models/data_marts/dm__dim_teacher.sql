WITH source AS (
    SELECT
       *
    FROM
       {{ ref('stg__dim_teacher') }}
)
SELECT
    *
FROM
    source