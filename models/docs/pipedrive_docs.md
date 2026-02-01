{% docs activity_id %}
Unique identifier for the activity in Pipedrive.
{% enddocs %}

{% docs activity_type_key %}
Activity type key used in Pipedrive (e.g., follow_up, meeting).
{% enddocs %}

{% docs activity_type_name %}
Display name for the activity type.
{% enddocs %}

{% docs assigned_to_user_id %}
User ID assigned as the owner of the activity.
{% enddocs %}

{% docs deal_id %}
Unique identifier for a deal in Pipedrive.
{% enddocs %}

{% docs is_done %}
Flag indicating whether the activity is completed.
{% enddocs %}

{% docs due_at %}
Timestamp when the activity is due.
{% enddocs %}

{% docs activity_type_id %}
Unique identifier for the activity type.
{% enddocs %}

{% docs is_active %}
Flag indicating whether the activity type is active.
{% enddocs %}

{% docs changed_at %}
Timestamp when the change was recorded.
{% enddocs %}

{% docs changed_field_key %}
Field key that was modified in the change event.
{% enddocs %}

{% docs new_value %}
New value assigned to the changed field.
{% enddocs %}

{% docs field_id %}
Unique identifier for the field definition.
{% enddocs %}

{% docs field_key %}
Field key used in Pipedrive APIs and change logs.
{% enddocs %}

{% docs field_name %}
Display name of the field.
{% enddocs %}

{% docs field_value_options %}
JSON options available for the field values.
{% enddocs %}

{% docs stage_id %}
Unique identifier for the pipeline stage.
{% enddocs %}

{% docs stage_name %}
Display name of the pipeline stage.
{% enddocs %}

{% docs user_id %}
Unique identifier for the user account.
{% enddocs %}

{% docs user_name %}
Full name of the user.
{% enddocs %}

{% docs email %}
Email address of the user.
{% enddocs %}

{% docs modified_at %}
Timestamp of the last user record update.
{% enddocs %}

{% docs stage_entered_at %}
Timestamp of the first time a deal entered a specific stage.
{% enddocs %}

{% docs first_call_at %}
Timestamp of the first completed sales call for a deal and call type.
{% enddocs %}

{% docs month_end %}
Month end date (last day of the month) used for monthly reporting buckets.
{% enddocs %}

{% docs month_start %}
Month start date (first day of the month) used for monthly reporting buckets.
{% enddocs %}

{% docs funnel_step %}
Canonical funnel step identifier (e.g., 1, 2, 2.1, 3, 3.1, 4-9).
{% enddocs %}

{% docs kpi_name %}
Funnel KPI label aligned to the sales process step.
{% enddocs %}

{% docs deals_count %}
Count of distinct deals reaching a funnel step during the month.
{% enddocs %}

{% docs sales_funnel_assumptions %}
Assumptions: "Entered each funnel step" is defined as the first time a deal enters
the corresponding stage (or completes Sales Call 1/2) based on the earliest timestamp.
Monthly buckets are based on month-end dates derived from the event timestamp.
{% enddocs %}

{% docs sales_funnel_caveats %}
Caveats: Activity completion relies on Pipedrive activity logging; missed or late updates
will shift counts. If stage names change, update the funnel mapping seeds to keep KPI
labels consistent.
{% enddocs %}
