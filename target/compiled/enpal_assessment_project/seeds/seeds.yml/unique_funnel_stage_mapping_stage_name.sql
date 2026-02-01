
    
    

select
    stage_name as unique_field,
    count(*) as n_records

from "postgres"."pipedrive_analytics_pipedrive_analytics"."funnel_stage_mapping"
where stage_name is not null
group by stage_name
having count(*) > 1


