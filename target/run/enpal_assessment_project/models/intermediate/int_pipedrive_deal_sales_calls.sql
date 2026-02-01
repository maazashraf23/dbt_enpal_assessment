
  
    

  create  table "postgres"."pipedrive_analytics_pipedrive_analytics"."int_pipedrive_deal_sales_calls__dbt_tmp"
  
  
    as
  
  (
    -- Base activity records with deal linkage and completion status.
with activities as (
    select
        activity_id,
        activity_type,
        deal_id,
        is_done,
        due_at
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_activity"
),

-- Activity type metadata to map type keys to human-readable names.
activity_types as (
    select
        activity_type,
        activity_type_name
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_activity_types"
),

-- Keep only completed Sales Call 1/2 activities.
sales_calls as (
    select
        a.deal_id,
        t.activity_type_name,
        a.due_at
    from activities a
    inner join activity_types t
        on a.activity_type = t.activity_type
    where t.activity_type_name in ('Sales Call 1', 'Sales Call 2')
      and a.is_done is true
      and a.due_at is not null
),

-- Capture the first completed sales call per deal and call type.
first_calls as (
    select
        deal_id,
        activity_type_name,
        min(due_at) as first_call_at
    from sales_calls
    group by
        deal_id,
        activity_type_name
)

select *
from first_calls
  );
  