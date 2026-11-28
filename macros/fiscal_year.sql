{% macro fiscal_year(date_column) %}
    {%- set start_month = var("fiscal_year_start_month", 7) -%}
    case
        when month({{ date_column }}) >= {{ start_month }}
        then year({{ date_column }}) + 1
        else year({{ date_column }})
    end
{% endmacro %}


{% macro fiscal_quarter(date_column) %}
    {%- set start_month = var("fiscal_year_start_month", 7) -%}
    cast(
        floor(mod(month({{ date_column }}) - {{ start_month }} + 12, 12) / 3) + 1
        as integer
    )
{% endmacro %}


{% macro fiscal_month(date_column) %}
    {%- set start_month = var("fiscal_year_start_month", 7) -%}
    mod(month({{ date_column }}) - {{ start_month }} + 12, 12) + 1
{% endmacro %}