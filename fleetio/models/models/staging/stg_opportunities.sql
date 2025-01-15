with base as(
    select *
    from {{ source('marketing_and_sales', 'raw_opportunities') }}
),

final as(
    select 
        id as opportunity_id,
        account_id,
        created_at,
        closed_at,
        is_closed,
        is_won,
        country,
        state,
        city
    from base
)

select *
from final