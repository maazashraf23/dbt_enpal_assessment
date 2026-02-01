with allowed as (
    select kpi_name, funnel_step from {{ ref('dim_stage') }}
    union
    select kpi_name, funnel_step
    from {{ ref('dim_activity_type') }}
    where funnel_step is not null
)

select r.*
from {{ ref('rep_sales_funnel_monthly') }} r
left join allowed a
    on r.kpi_name = a.kpi_name
   and r.funnel_step = a.funnel_step
where a.kpi_name is null
