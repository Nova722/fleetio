with leads as(
    select *
    from {{ ref('stg_leads') }}
),

contacts as(
    select *
    from {{ ref('stg_contacts') }}
),

accounts as(
    select *
    from {{ ref('stg_accounts') }}
),

opportunities as(
    select *
    from {{ ref('stg_opportunities') }}
),

final as(
    select
        a.lead_id,
        a.lead_first_name,
        a.lead_last_name,
        a.lead_job_title,
        a.lead_email,
        a.lead_company,
        a.lead_created_at_date,
        a.lead_converted_at_date,
        a.lead_source,
        a.lead_country,
        a.lead_city,
        a.lead_state,
        a.lead_industry,
        a.lead_fleet_size,
        /*we may want metrics on what happens to leads after they become opportunites
        for which we can use this column for any trends of leads that were not only
        converted but became won opportunities*/ 
        case when d.opportunity_is_closed = true and d.opportunity_is_won = true then 'won opportunity'
            when d.opportunity_is_closed = true and d.opportunity_is_won = false then 'lost opportunity'
            when d.opportunity_is_closed = false and d.opportunity_is_won = false then 'open opportunity'
            else 'lead not converted to opportunity' end as opportunity_status,
    from leads as a
    left join contacts as b  
        on a.lead_id = b.lead_id
    left join accounts as c  
        on b.account_id = c.account_id
    left join opportunities as d  
        on c.account_id = d.account_id
) select * from final