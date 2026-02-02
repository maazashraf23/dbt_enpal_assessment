

-- One row per deal and stage for the first entry timestamp.
select
    deal_id,
    stage_id,
    stage_entered_at
from {{ ref('int_pipedrive_deal_stage_firsts') }}
