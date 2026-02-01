
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select month_start
from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_date"
where month_start is null



  
  
      
    ) dbt_internal_test