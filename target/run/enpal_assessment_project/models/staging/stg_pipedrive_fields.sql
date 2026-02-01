
  
    

  create  table "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_fields__dbt_tmp"
  
  
    as
  
  (
    

with source as (
    select *
    from "postgres"."public"."fields"
),

renamed as (
    select
        id::int as field_id,
        field_key as field_key,
        name as field_name,
        field_value_options::jsonb as field_value_options
    from source
)

select *
from renamed
  );
  