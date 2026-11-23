with
    source as (
        select * from {{ source("adventure_works", "production_productcosthistory") }}
    ),
    renamed as (
        select
            productid as product_id,
            startdate as start_date,
            enddate as end_date,
            standardcost::number(19, 4) as standard_cost,
            modifieddate as modified_date
        from source
    )
select *
from renamed
