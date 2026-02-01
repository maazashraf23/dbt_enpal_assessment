

-- Monthly sales funnel KPI counts with complete month coverage and month-end dates.
with dim_date as (
    select
        month_start,
        month_end
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_date"
),

dim_stage as (
    select
        stage_id,
        funnel_step,
        kpi_name
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_stage"
),

dim_activity_type as (
    select
        activity_type_name,
        funnel_step,
        kpi_name
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."dim_activity_type"
    where funnel_step is not null
),

fct_stage_firsts as (
    select
        deal_id,
        stage_id,
        stage_entered_at
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."fct_deal_stage_firsts"
),

fct_sales_calls as (
    select
        deal_id,
        activity_type_name,
        first_call_at
    from "postgres"."pipedrive_analytics_pipedrive_analytics"."fct_deal_sales_calls"
),

-- Monthly counts for main stage-based funnel steps (1,2,3...9).
stage_kpis as (
    select
        (date_trunc('month', f.stage_entered_at) + interval '1 month - 1 day')::date as month,
        d.kpi_name as kpi_name,
        d.funnel_step as funnel_step,
        count(distinct f.deal_id) as deals_count
    from fct_stage_firsts f
    inner join dim_stage d
        on f.stage_id = d.stage_id
    where f.stage_entered_at is not null
    group by
        (date_trunc('month', f.stage_entered_at) + interval '1 month - 1 day')::date,
        d.kpi_name,
        d.funnel_step
),

-- Monthly counts for Sales Call 1 (2.1) and Sales Call 2 (3.1).
sales_call_kpis as (
    select
        (date_trunc('month', f.first_call_at) + interval '1 month - 1 day')::date as month,
        d.kpi_name as kpi_name,
        d.funnel_step as funnel_step,
        count(distinct f.deal_id) as deals_count
    from fct_sales_calls f
    inner join dim_activity_type d
        on f.activity_type_name = d.activity_type_name
    where f.first_call_at is not null
    group by
        (date_trunc('month', f.first_call_at) + interval '1 month - 1 day')::date,
        d.kpi_name,
        d.funnel_step
),

-- Combine stage steps and sales-call sub-steps.
unioned as (
    select * from stage_kpis
    union all
    select * from sales_call_kpis
),

-- Full KPI list for cross-join with months.
all_kpis as (
    select kpi_name, funnel_step from dim_stage
    union
    select kpi_name, funnel_step from dim_activity_type
),

-- Create complete grid of month x KPI and fill missing counts with 0.
spined as (
    select
        d.month_end as month,
        k.kpi_name,
        k.funnel_step,
        coalesce(u.deals_count, 0) as deals_count
    from dim_date d
    cross join all_kpis k
    left join unioned u
        on u.month = d.month_end
       and u.kpi_name = k.kpi_name
       and u.funnel_step = k.funnel_step
)

select
    month,
    kpi_name,
    funnel_step,
    deals_count
from spined
order by
    month,
    case funnel_step
        when '1' then 1
        when '2' then 2
        when '2.1' then 3
        when '3' then 4
        when '3.1' then 5
        when '4' then 6
        when '5' then 7
        when '6' then 8
        when '7' then 9
        when '8' then 10
        when '9' then 11
        else 99
    end