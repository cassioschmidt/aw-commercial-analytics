with
    source as (select * from {{ source('adventure_works', 'sales_store') }}),
    renamed as (
        select
            businessentityid as store_id,
            name as store_name,
            salespersonid as sales_person_id,
            demographics,
            rowguid as row_guid,
            modifieddate as modified_date
        from source
    )
select *
from renamed