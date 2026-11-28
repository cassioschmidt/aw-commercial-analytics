{% macro unknown_member_key() %}
    {{ dbt_utils.generate_surrogate_key(["'-1'"]) }}
{% endmacro %}


{% macro not_applicable_key() %}
    {{ dbt_utils.generate_surrogate_key(["'-2'"]) }}
{% endmacro %}