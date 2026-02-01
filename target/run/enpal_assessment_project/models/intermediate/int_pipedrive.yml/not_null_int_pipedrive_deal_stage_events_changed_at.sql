
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select changed_at
from "postgres"."pipedrive_analytics_pipedrive_analytics"."int_pipedrive_deal_stage_events"
where changed_at is null



  
  
      
    ) dbt_internal_test