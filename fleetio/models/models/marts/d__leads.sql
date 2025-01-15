with leads as(
    select *
    from {{ ref('stg_leads') }}
),

final as(
    select
        lead_id,
        first_name,
        last_name,
        job_title,
        email,
        company,
        created_at_date,
        converted_at_date,
        source,
        country,
        city,
        state,
        industry,
        fleet_size

    from leads  
)

select * from final