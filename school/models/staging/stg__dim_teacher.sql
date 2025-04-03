WITH source AS (
    SELECT
        *
    FROM
        {{ source('school', 'raw__teacher') }}
)

SELECT
    id_teacher,
    name AS techar_name
FROM
    source