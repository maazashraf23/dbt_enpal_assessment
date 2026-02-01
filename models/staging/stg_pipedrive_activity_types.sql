{{ config(
    materialized='table'
) }}

with source as (
    select *
    from {{ source('postgres_public', 'activity_types') }}
),

renamed as (
    select
        id::int as activity_type_id,
        name as activity_type_name,
        case
            when lower(active) in ('yes', 'true', '1') then true
            when lower(active) in ('no', 'false', '0') then false
        end as is_active,
        type as activity_type
    from source
)

select *
from renamed
