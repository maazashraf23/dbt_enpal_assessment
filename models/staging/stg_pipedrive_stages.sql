{{ config(
    materialized='table',
) }}

with source as (
    select *
    from {{ source('postgres_public', 'stages') }}
),

renamed as (
    select
        stage_id::int as stage_id,
        stage_name as stage_name
    from source
)

select *
from renamed
