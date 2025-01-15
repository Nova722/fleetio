with base as(
    select *
    from {{ source('marketing_and_sales', 'raw_leads') }}
),

final as(
    select 
        id as lead_id,
        first_name,
        last_name,
        job_title,
        email,
        company,
        /* I am going to be converting to date in staging 
        assuming we will never need the timestamp grain */
        date(created_at) as created_at_date,
        date(converted_at) as converted_at_date,
        source,
        country,
        city,
        state,
        industry,
        fleet_size
    from base
) select * from final