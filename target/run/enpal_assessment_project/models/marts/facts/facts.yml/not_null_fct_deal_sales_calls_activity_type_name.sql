
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select activity_type_name
from "postgres"."pipedrive_analytics_pipedrive_analytics"."fct_deal_sales_calls"
where activity_type_name is null



  
  
      
    ) dbt_internal_test