{{ config(
    materialized='table'
) }}

with source as (
    select *
    from {{ source('postgres_public', 'fields') }}
),

renamed as (
    select
        id::int as field_id,
        field_key as field_key,
        name as field_name,
        field_value_options::jsonb as field_value_options
    from source
)

select *
from renamed
