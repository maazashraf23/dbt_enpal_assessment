

-- One row per deal and sales call type for the first completed call timestamp.
select
    deal_id,
    activity_type_name,
    first_call_at
from "postgres"."pipedrive_analytics_pipedrive_analytics"."int_pipedrive_deal_sales_calls"