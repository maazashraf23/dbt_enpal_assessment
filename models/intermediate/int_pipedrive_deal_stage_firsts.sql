-- Stage change events per deal, potentially multiple per stage.
with stage_events as (
    select *
    from {{ ref('int_pipedrive_deal_stage_events') }}
),

-- Capture the first time a deal entered each stage.
firsts as (
    select
        deal_id,
        stage_id,
        funnel_stage_name,
        min(changed_at) as stage_entered_at
    from stage_events
    group by
        deal_id,
        stage_id,
        funnel_stage_name
)

select *
from firsts
