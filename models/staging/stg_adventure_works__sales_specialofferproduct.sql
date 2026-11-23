with
    source as (
        select * from {{ source("adventure_works", "sales_specialofferproduct") }}
    ),
    renamed as (
        select
            specialofferid as special_offer_id,
            productid as product_id,
            rowguid as row_guid,
            modifieddate as modified_date
        from source
    )
select *
from renamed
