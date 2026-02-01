{{ config(
    materialized='incremental'
) }}

with source as (
    select *
    from {{ source('postgres_public', 'deal_changes') }}
    {% if is_incremental() %}
    where change_time::timestamp >= (
        select coalesce(max(changed_at), '1900-01-01'::timestamp)
        from {{ this }}
    )
    {% endif %}
),

renamed as (
    select
        deal_id::int as deal_id,
        change_time::timestamp as changed_at,
        changed_field_key as changed_field_key,
        new_value as new_value
    from source
)

select *
from renamed
