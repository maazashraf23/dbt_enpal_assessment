
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    activity_type_name as unique_field,
    count(*) as n_records

from "postgres"."pipedrive_analytics_pipedrive_analytics"."funnel_activity_mapping"
where activity_type_name is not null
group by activity_type_name
having count(*) > 1



  
  
      
    ) dbt_internal_test