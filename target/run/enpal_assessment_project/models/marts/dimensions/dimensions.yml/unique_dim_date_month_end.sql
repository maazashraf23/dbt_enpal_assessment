
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    month_end as unique_field,
    count(*) as n_records

from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_date"
where month_end is not null
group by month_end
having count(*) > 1



  
  
      
    ) dbt_internal_test