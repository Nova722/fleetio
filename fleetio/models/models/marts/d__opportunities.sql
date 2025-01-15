with opportunities as(
    select *
    from {{ ref('stg_opportunities') }}
),

final as(
    select 
        id as opportunity_id,
        account_id,
        /* I am going to be converting to date in staging 
        assuming we will never need the timestamp grain */
        date(created_at) as created_at_date,
        date(closed_at) as closed_at_date,
        is_closed,
        is_won,
        country,
        state,
        city
    from opportunities
) select * from final




