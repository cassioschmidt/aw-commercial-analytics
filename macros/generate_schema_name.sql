{% macro generate_schema_name(custom_schema_name, node) -%}
    {#-
        Development: every model goes to the developer's own schema (target.schema).
        Production: models go to the schema named in the config (staging, marts, ...).
    -#}
    {%- if target.name == "prod" and custom_schema_name is not none -%}
        {{ custom_schema_name | trim }}
    {%- else -%} {{ target.schema }}
    {%- endif -%}
{%- endmacro %}