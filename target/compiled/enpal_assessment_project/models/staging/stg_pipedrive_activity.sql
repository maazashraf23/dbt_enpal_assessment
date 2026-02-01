

with source as (
    select *
    from "postgres"."public"."activity"
    
    where due_to::timestamp >= (
        select coalesce(max(due_at), '1900-01-01'::timestamp)
        from "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_activity"
    )
    
),

renamed as (
    select
        activity_id::int as activity_id,
        type as activity_type,
        assigned_to_user::int as assigned_to_user_id,
        deal_id::int as deal_id,
        done::boolean as is_done,
        due_to::timestamp as due_at
    from source
)

select *
from renamed