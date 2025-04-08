WITH source AS (
    SELECT
       *
    FROM
       {{ ref('stg__dim_date') }}
)
SELECT
    *
FROM
    source