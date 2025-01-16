with accounts as(
    select *
    from {{ ref('stg_accounts') }}
),

opportunities as(
    select *
    from {{ ref('stg_opportunities') }}
),

contacts as(
    select *
    from {{ ref('stg_contacts') }}
),

leads as(
    select *
    from {{ ref('stg_leads') }}
),

final as(
    select 
        a.account_id,
        a.account_company,
        a.account_country,
        a.account_state,
        a.account_city,
        a.primary_contact_id,
        c.contact_first_name as primary_contact_first_name,
        c.contact_last_name as primary_contact_last_name,
        c.contact_job_title as primary_contact_job_title,
        c.contact_email as primary_contact_email,
        a.account_industry, 
        a.account_fleet_size,
        d.lead_created_at_date,
        d.lead_converted_at_date,
        d.lead_source,
        b.opportunity_created_at_date,
        b.opportunity_closed_at_date,
        b.opportunity_is_closed,
        b.opportunity_is_won
    from accounts as a  
    left join stg_opportunities as b 
        on a.account_id = b.account_id
    left join stg_contacts as c 
        on a.primary_contact_id = c.contact_id
    left join stg_leads as d 
        on c.lead_id = d.lead_id
) select * from final