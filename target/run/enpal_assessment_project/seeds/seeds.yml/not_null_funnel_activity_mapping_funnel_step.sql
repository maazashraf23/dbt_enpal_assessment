
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select funnel_step
from "postgres"."pipedrive_analytics_pipedrive_analytics"."funnel_activity_mapping"
where funnel_step is null



  
  
      
    ) dbt_internal_test