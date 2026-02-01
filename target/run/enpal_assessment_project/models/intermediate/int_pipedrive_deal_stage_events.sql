
  
    

  create  table "postgres"."pipedrive_analytics_pipedrive_analytics"."int_pipedrive_deal_stage_events__dbt_tmp"
  
  
    as
  
  (
    -- Extract only stage change events from the deal change log.
with stage_changes as (
    select
        deal_id,
        changed_at,
        -- new_value holds the stage_id when changed_field_key = 'stage_id'
        new_value::int as stage_id
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_deal_changes"
    where changed_field_key = 'stage_id'
      and new_value is not null
),

-- Reference mapping of stage_id to stage_name as configured in Pipedrive.
stages as (
    select
        stage_id,
        stage_name
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_stages"
),

mapping as (
    select
        stage_name,
        kpi_name
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."funnel_stage_mapping"
),

-- Attach canonical KPI names to each stage change event.
joined as (
    select
        sc.deal_id,
        sc.changed_at,
        sc.stage_id,
        s.stage_name,
        mapping.kpi_name as funnel_stage_name
    from stage_changes sc
    left join stages s
        on sc.stage_id = s.stage_id
    left join mapping
        on lower(s.stage_name) = lower(mapping.stage_name)
)

select *
from joined
  );
  