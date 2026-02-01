{{ config(
    indexes=[
        {'columns': ['deal_id']},
        {'columns': ['activity_type_name']},
        {'columns': ['first_call_at']}
    ]
) }}

-- One row per deal and sales call type for the first completed call timestamp.
select
    deal_id,
    activity_type_name,
    first_call_at
from {{ ref('int_pipedrive_deal_sales_calls') }}
