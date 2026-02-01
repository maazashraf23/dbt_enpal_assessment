
      insert into "postgres"."pipedrive_analytics_pipedrive_analytics"."stg_pipedrive_activity" ("activity_id", "activity_type", "assigned_to_user_id", "deal_id", "is_done", "due_at")
    (
        select "activity_id", "activity_type", "assigned_to_user_id", "deal_id", "is_done", "due_at"
        from "stg_pipedrive_activity__dbt_tmp152211649585"
    )


  