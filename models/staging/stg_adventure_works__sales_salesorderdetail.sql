with
    source as (select * from {{ source("adventure_works", "sales_salesorderdetail")}}),
    renamed as (
        select
            SALESORDERID as sales_order_id,
            SALESORDERDETAILID as sales_order_detail_id,
            CARRIERTRACKINGNUMBER as carrier_tracking_number,
            ORDERQTY as order_quantity,
            PRODUCTID as product_id,
            SPECIALOFFERID as special_offer_id,
            UNITPRICE::number(19,4) as unit_price,
            UNITPRICEDISCOUNT::number(10,4) as unit_price_discount,
            ROWGUID as row_guid,
            MODIFIEDDATE as modified_date
        from source
    )
select *
from renamed
