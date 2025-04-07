WITH source AS (
    SELECT
        *
    FROM
        {{ source('school', 'raw__teacher') }}
)

SELECT
    id_teacher,
    name AS teacher_name
FROM
    source