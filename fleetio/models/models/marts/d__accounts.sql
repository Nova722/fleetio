with accounts as(
    select *
    from {{ ref('stg_accounts') }}
),

contacts as(
    select *
    from {{ ref('stg_contacts') }}
),

opportunities as(
    select *
    from {{ ref('stg_opportunities') }}
),

leads as(
    select *
    from {{ ref('stg_leads') }}
),

final as(
    select
        a.account_id,
        a.company,
        b.first_name as contact_first_name,
        b.last_name as contact_last_name,
        b.job_title as contact_job_title,
        b.email as contact_email,
        a.country,
        a.state,
        a.city,
        a.industry,
        a.fleet_size,
        c.created_at as opportunity_created_at,
        c.closed_at as opportunity_closed_at,
        c.is_won as opportunity_is_won,
        c.is_closed as opportunity_is_closed,
        d.first_name as lead_first_name,
        d.last_name as lead_last_name,
        d.job_title as lead_job_title,
        d.created_at as lead_created_at,
        d.converted_at as lead_coverted_at,
        d.source as lead_source

    from accounts as a  
    left join contacts as b  
        on a.primary_contact_id = b.contact_id
    left join opportunities as c  
        on a.account_id = c.account_id
     left join leads as d  
         on b.lead_id = d.lead_id
)

select * from final