with
    source as (select * from {{ source("adventure_works", "production_scrapreason") }}),
    renamed as (
        select
            scrapreasonid as scrap_reason_id,
            name as scrap_reason_name,
            modifieddate as modified_date
        from source
    )
select *
from renamed
