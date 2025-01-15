with leads as(
    select *
    from {{ ref('stg_leads') }}
),

contacts as(
    select *
    from {{ ref('stg_contacts') }}
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
    left join contacts as b   
        on a.lead_id = b.lead_id
)

select * from final