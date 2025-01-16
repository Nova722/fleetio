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
        a.first_name,
        a.last_name,
        a.job_title,
        a.email,
        a.company,
        a.created_at_date,
        a.converted_at_date,
        /*we may want metrics on what happens to leads after they become opportunites
        for which we can use this column for any trends of leads that were not only
        converted but became won opportunities*/ 
        case when d.is_closed = true and d.is_won = true then 'won opportunity'
            when d.is_closed = true and d.is_won = false then 'lost opportunity'
            when d.is_closed = false and d.is_won = false then 'open opportunity'
            else 'status missing mapping' end as opportunity_status,
        a.source,
        a.country,
        a.city,
        a.state,
        a.industry,
        a.fleet_size
    from leads as a
    left join contacts as b  
        on a.lead_id = b.lead_id
    left join accounts as c  
        on b.account_id = c.account_id
    left join opportunities as d  
        on c.account_id = d.account_id
) select * from final