
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select *
from "postgres"."pipedrive_analytics_pipedrive_analytics"."rep_sales_funnel_monthly"
where deals_count < 0
  
  
      
    ) dbt_internal_test