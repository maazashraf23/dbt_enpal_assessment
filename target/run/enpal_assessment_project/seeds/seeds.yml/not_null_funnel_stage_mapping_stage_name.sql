
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select stage_name
from "postgres"."pipedrive_analytics_pipedrive_analytics"."funnel_stage_mapping"
where stage_name is null



  
  
      
    ) dbt_internal_test