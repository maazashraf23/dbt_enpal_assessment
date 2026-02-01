
    
    

with child as (
    select month as from_field
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."rep_sales_funnel_monthly"
    where month is not null
),

parent as (
    select month_end as to_field
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_date"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


