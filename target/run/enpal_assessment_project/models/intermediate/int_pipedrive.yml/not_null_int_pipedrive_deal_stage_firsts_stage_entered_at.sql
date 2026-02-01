
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select stage_entered_at
from "postgres"."pipedrive_analytics_pipedrive_analytics"."int_pipedrive_deal_stage_firsts"
where stage_entered_at is null



  
  
      
    ) dbt_internal_test