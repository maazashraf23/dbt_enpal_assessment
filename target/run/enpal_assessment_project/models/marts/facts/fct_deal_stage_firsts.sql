
  
    

  create  table "postgres"."pipedrive_analytics_pipedrive_analytics"."fct_deal_stage_firsts__dbt_tmp"
  
  
    as
  
  (
    

-- One row per deal and stage for the first entry timestamp.
select
    deal_id,
    stage_id,
    stage_entered_at
from "postgres"."pipedrive_analytics_pipedrive_analytics"."int_pipedrive_deal_stage_firsts"
  );
  