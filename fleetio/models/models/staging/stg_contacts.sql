with base as(
    select *
    from {{ source('marketing_and_sales', 'raw_contacts') }}
),

final as(
    select 
        id as contact_id,
        first_name,
        last_name,
        job_title,
        email,
        account_id,
        lead_id,
        created_at
    from base
)

select *
from final