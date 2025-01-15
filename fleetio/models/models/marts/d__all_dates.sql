with base as(
    /* This package has many different date dimensions that could be
    explored as needed but I will only pull the things I need
    for simplicity */
    {{ dbt_date.get_date_dimension("2010-01-01", "2050-01-01") }}
),

final as(
    select 
        {{ dbt_utils.generate_surrogate_key(['date_day']) }} as date_id,
        date_day,
        day_of_week_name, 
        week_start_date,
        week_end_date,
        month_start_date,
        month_end_date
    from base
) select * from final