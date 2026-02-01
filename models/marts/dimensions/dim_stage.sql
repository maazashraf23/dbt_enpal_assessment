-- Stage dimension with canonical funnel step mapping.
with stages as (
    select
        stage_id,
        stage_name
    from {{ ref('stg_pipedrive_stages') }}
),

mapped as (
    select
        stage_id,
        stages.stage_name,
        mapping.funnel_step,
        mapping.kpi_name
    from stages
    left join {{ ref('funnel_stage_mapping') }} mapping
        on lower(stages.stage_name) = lower(mapping.stage_name)
)

select *
from mapped
