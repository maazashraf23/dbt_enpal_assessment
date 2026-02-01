
    
    

select
    field_id as unique_field,
    count(*) as n_records

from "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_fields"
where field_id is not null
group by field_id
having count(*) > 1


