with
source as (
    select * from {{ source("adventure_works", "sales_salesterritoryhistory") }}
),
renamed as (
    select
        businessentityid as sales_person_id,
        territoryid as territory_id,
        startdate as start_date,
        enddate as end_date,
        rowguid as row_guid,
        modifieddate as modified_date
    from source
)
select * from renamed
