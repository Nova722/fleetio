with base as(
    select *
    from {{ source('marketing_and_sales', 'raw_accounts') }}
),

final as(
    select 
        id as account_id,
        company as account_company,
        primary_contact_id,
        country as account_country,
        state as account_state,
        city as account_city,
        industry as account_industry, 
        fleet_size as account_fleet_size
    from base
)select * from final