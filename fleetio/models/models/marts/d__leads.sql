with leads as(
    select *
    from {{ ref('stg_leads') }}
),

final as(
    select
        a.lead_id,
        a.first_name,
        a.last_name,
        a.job_title,
        a.email,
        a.company,
        a.created_at_date,
        a.converted_at_date,
        a.source,
        a.country,
        a.city,
        a.state,
        a.industry,
        a.fleet_size
    from leads as a
) select * from final