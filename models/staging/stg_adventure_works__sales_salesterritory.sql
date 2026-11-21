with
    source as (select * from {{ source("adventure_works", "sales_salesterritory") }}),
    renamed as (
        select
            territoryid as territory_id,
            name as territory_name,
            countryregioncode as country_region_code,
            "GROUP" as territory_group,
            salesytd::number(19, 4) as sales_year_to_date_amount,
            saleslastyear::number(19, 4) as sales_last_year_amount,
            costytd as cost_year_to_date_amount,
            costlastyear as cost_last_year_amount,
            rowguid as row_guid,
            modifieddate as modified_date
        from source
    )
select *
from renamed