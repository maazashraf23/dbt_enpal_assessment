
      insert into "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_deal_changes" ("deal_id", "changed_at", "changed_field_key", "new_value")
    (
        select "deal_id", "changed_at", "changed_field_key", "new_value"
        from "stg_pipedrive_deal_changes__dbt_tmp152211843605"
    )


  