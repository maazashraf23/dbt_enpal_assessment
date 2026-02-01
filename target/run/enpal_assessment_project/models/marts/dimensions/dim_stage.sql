
  
    

  create  table "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_stage__dbt_tmp"
  
  
    as
  
  (
    -- Stage dimension with canonical funnel step mapping.
with stages as (
    select
        stage_id,
        stage_name
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_stages"
),

mapped as (
    select
        stage_id,
        stages.stage_name,
        mapping.funnel_step,
        mapping.kpi_name
    from stages
    left join "postgres"."pipedrive_analytics_pipedrive_analytics"."funnel_stage_mapping" mapping
        on lower(stages.stage_name) = lower(mapping.stage_name)
)

select *
from mapped
  );
  