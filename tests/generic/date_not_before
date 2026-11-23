{% test date_not_before(model, column_name, compare_column) %}

    select {{ column_name }} as invalid_value, {{ compare_column }} as compare_value
    from {{ model }}
    where {{ column_name }} < {{ compare_column }}

{% endtest %}
