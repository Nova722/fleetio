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
        /* I am going to be converting to date in staging 
        assuming we will never need the timestamp grain
        if we do ever need it I would add a column here called created_at
        so no downstream changes would be needed */
        date(created_at) as created_at_date
    from base
)

select *
from final