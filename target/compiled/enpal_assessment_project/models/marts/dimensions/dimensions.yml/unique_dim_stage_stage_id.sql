
    
    

select
    stage_id as unique_field,
    count(*) as n_records

from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_stage"
where stage_id is not null
group by stage_id
having count(*) > 1


