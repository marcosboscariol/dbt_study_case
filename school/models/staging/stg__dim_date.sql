WITH source AS(
    SELECT
        *
    FROM
        {{ source('school', 'dim__date') }}
)

SELECT
    date::DATE,
    year::NUMERIC,
    quarter::VARCHAR,
    month_number::NUMERIC,
    month_name::VARCHAR,
    day::NUMERIC
FROM
    source