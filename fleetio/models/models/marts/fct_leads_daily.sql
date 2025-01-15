with d__leads as(
    select *
    from {{ ref('d__leads') }}
),

final as(
    select 
        /*I could also use the lead_id since this is nearly a 1:1 of the d__leads table
        but would prefer having the same primary key in dimension and fact tables  */
        {{ dbt_utils.generate_surrogate_key(['lead_id', 'company', 'created_at_date']) }},
        created_at_date,
        converted_at_date,
        /*creating numerical fields for the BI tool to count converted vs non converted leads */        
        case when converted_at_date is not null then 1 else 0 as is_converted,
        case when converted_at_date is null then 1 else 0 as is_not_converted,
        company,
        source,
        industry,
        fleet_size,
        country,
        city,
        state,
        industry

    from d__leads
    left join 
) select * from final