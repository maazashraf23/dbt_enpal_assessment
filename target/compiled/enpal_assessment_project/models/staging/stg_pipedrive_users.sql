

with source as (
    select *
    from "postgres"."public"."users"
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