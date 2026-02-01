# Project Documentation

This document explains the project end-to-end in plain language so a non-technical
reader can understand the structure and purpose of every piece.

## 1) What this project does
We convert raw Pipedrive CRM data into a clean, reliable monthly sales funnel
report. The final report shows how many deals entered each funnel step per month.

Funnel steps (KPIs):
1. Lead Generation
2. Qualified Lead
2.1 Sales Call 1
3. Needs Assessment
3.1 Sales Call 2
4. Proposal/Quote Preparation
5. Negotiation
6. Closing
7. Implementation/Onboarding
8. Follow-up/Customer Success
9. Renewal/Expansion

Final report columns:
- month
- kpi_name
- funnel_step
- deals_count

## 2) Raw data inputs
Raw CSVs live in `raw_data/` and are loaded into Postgres. Key raw tables:
- activity
- activity_types
- deal_changes
- fields
- stages
- users

## 3) How dbt connects to Postgres
dbt reads connection settings from `profiles.yml` (not from dbt_project.yml):
- dbname: postgres
- schema: pipedrive_analytics

So dbt builds tables inside the `postgres` database, under the
`pipedrive_analytics` schema.

## 4) Source definitions (raw tables)
`models/sources/sources.yml` defines the raw tables as dbt sources, with
column-level tests and shared documentation references.

We use `{{ doc('...') }}` to keep column descriptions in a single place.

## 5) Centralized documentation
All reusable column definitions live in:
`models/docs/pipedrive_docs.md`

Every YAML file references those doc blocks, so descriptions are defined once.

## 6) Staging models (cleaning layer)
Staging models standardize names and types:
- stg_pipedrive_activity.sql
- stg_pipedrive_activity_types.sql
- stg_pipedrive_deal_changes.sql
- stg_pipedrive_stages.sql
- stg_pipedrive_users.sql

These models clean and standardize raw data for analytics.

## 7) Intermediate models (business logic)
Intermediate models create reusable business concepts:
- int_pipedrive_deal_stage_events.sql
  Extracts stage change events from the deal change log.
- int_pipedrive_deal_stage_firsts.sql
  Finds the first time each deal entered each stage.
- int_pipedrive_deal_sales_calls.sql
  Finds the first completed Sales Call 1/2 per deal.

## 8) Funnel mapping (data-driven)
We use seed tables (instead of hard-coded SQL) to map funnel logic:
- seeds/funnel_stage_mapping.csv
- seeds/funnel_activity_mapping.csv

This makes updates easy and auditable.

## 9) Dimension models
Dimensions standardize attributes for reporting:
- dim_stage.sql
  Maps stages to funnel steps and KPI names (using the seed).
- dim_activity_type.sql
  Maps activity types to funnel sub-steps (using the seed).
- dim_date.sql
  Builds a month-end date spine for consistent monthly reporting.

## 10) Fact models
Facts are event-level tables:
- fct_deal_stage_firsts.sql
  First time a deal entered a stage.
- fct_deal_sales_calls.sql
  First completed Sales Call 1/2 per deal.

Indexes were added for query performance.

## 11) Final reporting model
`rep_sales_funnel_monthly.sql` creates the monthly funnel report:
- Counts deals by month and funnel step
- Uses month-end dates
- Fills missing month/KPI combinations with 0

## 12) Tests and data quality
We added data tests across sources, staging, facts, and reporting:
- not_null / unique on keys where safe
- relationships between facts and dimensions
- accepted_values for funnel_step
- custom tests for non-negative counts and valid KPI mapping

Custom tests:
- tests/test_rep_sales_funnel_monthly_non_negative.sql
- tests/test_rep_sales_funnel_monthly_kpi_valid.sql

## 13) Key assumptions
Documented in dbt docs blocks:
- "Entered step" means the first time a deal reached that stage or completed the
  Sales Call.
- Monthly buckets use month-end dates.

## 14) Known caveats
- If activities are not logged consistently, counts can be lower than reality.
- If stage names change, update the mapping seeds to keep KPIs consistent.

## 15) How to run
Suggested commands:
1) dbt seed
2) dbt run
3) dbt test

