with opportunities as(
    select *
    from {{ ref('stg_opportunities') }}
),

final as(
    select 
        opportunity_id,
        account_id,
        created_at_date,
        closed_at_date,
        is_closed,
        is_won,
        country,
        state,
        city
    from opportunities
) select * from final




