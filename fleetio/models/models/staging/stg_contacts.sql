with base as(
    select *
    from {{ source('marketing_and_sales', 'raw_contacts') }}
),

final as(
    select 
        id as contact_id,
        first_name as contact_first_name,
        last_name as contact_last_name,
        job_title as contact_job_title,
        email as contact_email,
        account_id,
        lead_id,
        created_at as contact_created_at,
        date(created_at) as contact_created_at_date
    from base
) select * from final