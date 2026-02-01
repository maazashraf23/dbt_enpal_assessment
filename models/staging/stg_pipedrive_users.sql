{{ config(
    materialized='table',
    unique_key= 'user_id'
) }}

with source as (
    select *
    from {{ source('postgres_public', 'users') }}
),

renamed as (
    select
        id::int as user_id,
        name as user_name,
        email as email,
        modified::timestamp as modified_at
    from source
)

select *
from renamed
