with d__leads as(
    select *
    from {{ ref('d__leads') }}
),

final as(
    select 
        /*I could also use the lead_id since this is nearly a 1:1 of the d__leads table
        but would prefer not having the same primary key in dimension and fact tables  */
        {{ dbt_utils.generate_surrogate_key(['lead_id', 'company', 'created_at_date']) }} as lead_id_daily,
        created_at_date,
        converted_at_date,
        /*creating numerical fields for the BI tool to count converted vs non converted leads 
        if sales and marketing want to see some ratios*/        
        case when converted_at_date is not null then 1 else 0 end as is_converted,
        case when converted_at_date is null then 1 else 0 end as is_not_converted,
        company,
        source,
        industry,
        fleet_size,
        first_name,
        last_name,
        job_title,
        email,
        country,
        city,
        state
    from d__leads
) select * from final