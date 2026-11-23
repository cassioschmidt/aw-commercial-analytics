with
    source as (select * from {{ source("adventure_works", "sales_currency") }}),
    renamed as (
        select
            currencycode as currency_code,
            name as currency_name,
            modifieddate as modified_date
        from source
    )
select *
from renamed
