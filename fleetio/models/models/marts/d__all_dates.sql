WITH base AS (
    SELECT *
    FROM {{ dbt_utils.date_spine(
        datepart="day",
        start_date="2015-01-01", 
        end_date= "2030-01-01"
    ) }}
)
SELECT * FROM base;