
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select kpi_name
from (select * from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_activity_type" where activity_type_name in ('Sales Call 1','Sales Call 2')) dbt_subquery
where kpi_name is null



  
  
      
    ) dbt_internal_test