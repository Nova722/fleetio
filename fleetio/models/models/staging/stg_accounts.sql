with base as(
    select *
    from {{ source('marketing_and_sales', 'raw_accounts') }}
),

final as(
    select 
        id as account_id,
        company,
        primary_contact_id,
        country,
        state,
        city,
        industry, 
        fleet_size
    from base
)select * from final