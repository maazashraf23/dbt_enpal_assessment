
    
    



select funnel_step
from (select * from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_activity_type" where activity_type_name in ('Sales Call 1','Sales Call 2')) dbt_subquery
where funnel_step is null


