with
    source as (
        select * from {{ source("adventure_works", "sales_countryregioncurrency") }}
    ),
    renamed as (
        select
            countryregioncode as country_region_code,
            currencycode as currency_code,
            modifieddate as modified_date
        from source
    )
select *
from renamed
