with
    source as (select * from {{ source("adventure_works", "sales_specialoffer") }}),
    renamed as (
        select
            specialofferid as special_offer_id,
            description as special_offer_description,
            discountpct::number(10, 4) as discount_percent,
            type as special_offer_type,
            category as special_offer_category,
            startdate as start_date,
            enddate as end_date,
            minqty as minimum_quantity,
            maxqty as maximum_quantity,
            rowguid as row_guid,
            modifieddate as modified_date
        from source
    )
select *
from renamed