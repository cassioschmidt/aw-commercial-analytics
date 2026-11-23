with
    source as (select * from {{ source("adventure_works", "sales_currencyrate") }}),
    renamed as (
        select
            currencyrateid as currency_rate_id,
            currencyratedate as currency_rate_date,
            fromcurrencycode as from_currency_code,
            tocurrencycode as to_currency_code,
            averagerate::number(19, 4) as average_rate,
            endofdayrate::number(19, 4) as end_of_day_rate,
            modifieddate as modified_date
        from source
    )
select *
from renamed
