with base as(
    select *
    from {{ source('marketing_and_sales', 'raw_opportunities') }}
),

final as(
    select 
        id as opportunity_id,
        account_id,
        created_at as opportunity_created_at,
        date(created_at) as opportunity_created_at_date,
        closed_at as opportunity_closed_at,
        date(closed_at) opportunity_closed_at_date,
        is_closed as opportunity_is_closed,
        is_won as opportunity_is_won,
        country as opportunity_country,
        state as opportunity_state,
        city as opportunity_city
    from base
) select * from final