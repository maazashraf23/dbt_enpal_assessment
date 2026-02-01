
  
    

  create  table "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_stages__dbt_tmp"
  
  
    as
  
  (
    

with source as (
    select *
    from "postgres"."public"."stages"
),

renamed as (
    select
        stage_id::int as stage_id,
        stage_name as stage_name
    from source
)

select *
from renamed
  );
  