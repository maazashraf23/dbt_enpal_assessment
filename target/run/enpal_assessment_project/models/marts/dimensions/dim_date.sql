
  
    

  create  table "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_date__dbt_tmp"
  
  
    as
  
  (
    -- Monthly date spine used for reporting at month-end grain.
with stage_firsts as (
    select
        stage_entered_at
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."int_pipedrive_deal_stage_firsts"
),

sales_calls as (
    select
        first_call_at
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."int_pipedrive_deal_sales_calls"
),

all_dates as (
    select stage_entered_at as event_ts from stage_firsts
    union all
    select first_call_at as event_ts from sales_calls
),

bounds as (
    select
        min(event_ts) as min_ts,
        max(event_ts) as max_ts
    from all_dates
),

months as (
    select
        date_trunc('month', dd)::date as month_start,
        (date_trunc('month', dd) + interval '1 month - 1 day')::date as month_end
    from bounds,
         generate_series(
             date_trunc('month', min_ts),
             date_trunc('month', max_ts),
             interval '1 month'
         ) as dd
    where min_ts is not null
      and max_ts is not null
)

select *
from months
  );
  