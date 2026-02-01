
  
    

  create  table "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_activity_type__dbt_tmp"
  
  
    as
  
  (
    -- Activity type dimension with mapping to funnel sub-steps.
with activity_types as (
    select
        activity_type_id,
        activity_type_name,
        is_active,
        activity_type
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_activity_types"
),

mapped as (
    select
        activity_type_id,
        activity_types.activity_type_name,
        is_active,
        activity_type,
        mapping.funnel_step,
        mapping.kpi_name
    from activity_types
    left join "postgres"."pipedrive_analytics_pipedrive_analytics"."funnel_activity_mapping" mapping
        on lower(activity_types.activity_type_name) = lower(mapping.activity_type_name)
)

select *
from mapped
  );
  