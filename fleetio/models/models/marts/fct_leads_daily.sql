with d__leads as(
    select *
    from {{ ref('d__leads') }}
),

final as(
    select 
        {{ dbt_utils.generate_surrogate_key(['lead_id', 'lead_company', 'lead_created_at_date']) }} as lead_id_daily,
        lead_created_at_date,
        lead_converted_at_date,
        /*creating numerical fields for the BI tool to count converted vs non converted leads 
        if sales and marketing want to see some ratios*/        
        case when lead_converted_at_date is not null then 1 else 0 end as is_converted,
        case when lead_converted_at_date is null then 1 else 0 end as is_not_converted,
        lead_company,
        lead_source,
        lead_industry,
        lead_fleet_size,
        lead_first_name,
        lead_last_name,
        lead_job_title,
        lead_email,
        lead_country,
        lead_city,
        lead_state
    from d__leads
) select * from final