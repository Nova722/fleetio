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
        created_at,
        converted_at,
        source,
        country,
        city,
        state,
        industry,
        fleet_size
    from base
)

select *
from final