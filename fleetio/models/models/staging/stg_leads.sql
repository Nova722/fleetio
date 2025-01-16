with base as(
    select *
    from {{ source('marketing_and_sales', 'raw_leads') }}
),

final as(
    select 
        id as lead_id,
        first_name as lead_first_name,
        last_name as lead_last_name,
        job_title as lead_job_title,
        email as lead_email,
        company as lead_company,
        created_at as lead_created_at,
        date(created_at) as lead_created_at_date,
        converted_at as lead_converted_at,
        date(converted_at) as lead_converted_at_date,
        source as lead_source,
        country as lead_country,
        city as lead_city,
        state as lead_state,
        industry as lead_industry,
        fleet_size as lead_fleet_size
    from base
) select * from final