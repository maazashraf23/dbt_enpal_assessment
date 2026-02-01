
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select first_call_at
from "postgres"."pipedrive_analytics_pipedrive_analytics"."int_pipedrive_deal_sales_calls"
where first_call_at is null



  
  
      
    ) dbt_internal_test