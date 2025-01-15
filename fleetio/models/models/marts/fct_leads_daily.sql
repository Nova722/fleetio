with d__leads as(
    select *
    from {{ ref('stg_leads') }}
),

final as(
    select {{ dbt_utils.generate_surrogate_key(['lead_id', 'company', 'converted_at_date']) }}
    from d__leads
) select * from final