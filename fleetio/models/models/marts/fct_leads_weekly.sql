with fct_leads_daily as(
    select *
    from {{ ref('fct_leads_daily') }}
),

d__all_dates as(
    select *
    from {{ ref('d__all_dates') }}
),

combined as(
    select 
         /*I still need some dimensions for the BI tool to explore so this will not
         be a 1 row = 1 week, it will include other dimensions*/
        a.source,
        a.industry,
        a.fleet_size,
        b.week_start_date as conversion_week_start_date,
        b.week_end_date as conversion_week_end_date,
        sum(a.is_converted) as converted,
        sum(a.is_not_converted) as did_not_convert
    from fct_leads_daily as a  
    left join d__all_dates as b 
        on a.converted_at_date = b.date_day
    group by 1, 2, 3, 4, 5
) select * from combined