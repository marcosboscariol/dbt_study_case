WITH source AS (
    SELECT
        *,
        {{ dbt_utils.generate_surrogate_key(['id_course', 'id_teacher']) }} AS natural_key
    FROM {{ source('school', 'raw__course_details') }}
),

latest_records AS (
    SELECT
        natural_key,
        date::DATE AS valid_from,
        NULL::DATE AS valid_to,
        TRUE AS is_current,
        {{ dbt_utils.generate_surrogate_key([
            'id_course',
            'id_teacher',
            'date',
            'minimum_grade'
        ]) }} AS surrogate_key,  
        id_course::VARCHAR,
        id_teacher::VARCHAR,
        minimum_grade::NUMERIC
    FROM source
)

SELECT *
FROM latest_records