{{ config(materialized="table") }}

with

date_spine as (
    {{
        dbt_utils.date_spine(
            datepart="day",
            start_date="cast('" ~ var("date_dim_start", "2010-07-01") ~ "' as date)",
            end_date="dateadd('day', 1, cast('"
            ~ var("date_dim_end", "2016-06-30")
            ~ "' as date))",
        )
    }}
),

calendar as (
    select
        cast(date_day as date) as full_date,
        {{ fiscal_year("date_day") }} as fiscal_year,
        {{ fiscal_quarter("date_day") }} as fiscal_quarter,
        {{ fiscal_month("date_day") }} as fiscal_month_number
    from date_spine
),

dates as (
    select
        cast(to_char(full_date, 'YYYYMMDD') as integer) as date_key,
        full_date,
        year(full_date) as calendar_year,
        quarter(full_date) as calendar_quarter,
        month(full_date) as month_number,
        monthname(full_date) as month_name,
        dayofweekiso(full_date) as day_of_week_number,
        dayname(full_date) as day_name,
        dayofweekiso(full_date) in (6, 7) as is_weekend,
        fiscal_year,
        fiscal_quarter,
        fiscal_month_number,
        'FY' || fiscal_year as fiscal_year_label,
        'FY' || fiscal_year || ' Q' || fiscal_quarter as fiscal_quarter_label
    from calendar
),

unknown_member as (
    select
        -1 as date_key,
        cast(null as date) as full_date,
        cast(null as integer) as calendar_year,
        cast(null as integer) as calendar_quarter,
        cast(null as integer) as month_number,
        'Unknown' as month_name,
        cast(null as integer) as day_of_week_number,
        'Unknown' as day_name,
        false as is_weekend,
        cast(null as integer) as fiscal_year,
        cast(null as integer) as fiscal_quarter,
        cast(null as integer) as fiscal_month_number,
        'Unknown' as fiscal_year_label,
        'Unknown' as fiscal_quarter_label
)

select *
from dates
union all
select *
from unknown_member