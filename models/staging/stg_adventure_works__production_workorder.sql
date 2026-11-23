with
    source as (select * from {{ source("adventure_works", "production_workorder") }}),
    renamed as (
        select
            workorderid as work_order_id,
            productid as product_id,
            orderqty as order_quantity,
            scrappedqty as scrapped_quantity,
            startdate as start_date,
            enddate as end_date,
            duedate as due_date,
            scrapreasonid as scrap_reason_id,
            modifieddate as modified_date
        from source
    )
select *
from renamed
