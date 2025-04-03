WITH source AS(
    SELECT
        *
    FROM
        {{ source('school', 'dim__date') }}
)

SELECT
    date,
    year,
    quarter,
    month_number,
    month_name,
    day
FROM
    source