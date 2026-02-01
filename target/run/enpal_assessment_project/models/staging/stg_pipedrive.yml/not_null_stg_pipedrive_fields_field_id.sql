
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select field_id
from "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_fields"
where field_id is null



  
  
      
    ) dbt_internal_test