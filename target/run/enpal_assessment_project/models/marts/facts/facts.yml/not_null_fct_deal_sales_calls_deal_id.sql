
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select deal_id
from "postgres"."pipedrive_analytics_pipedrive_analytics"."fct_deal_sales_calls"
where deal_id is null



  
  
      
    ) dbt_internal_test