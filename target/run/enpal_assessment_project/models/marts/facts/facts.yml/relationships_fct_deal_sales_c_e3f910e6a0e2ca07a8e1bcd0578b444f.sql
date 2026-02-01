
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select activity_type_name as from_field
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."fct_deal_sales_calls"
    where activity_type_name is not null
),

parent as (
    select activity_type_name as to_field
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_activity_type"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test