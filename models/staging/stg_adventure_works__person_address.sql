with
    source as (select * from {{ source('adventure_works', 'person_address') }}),
    renamed as (
        select
            addressid as address_id,
            addressline_1 as address_line_1,
            addressline_2 as address_line_2,
            city,
            stateprovinceid as state_province_id,
            postalcode as postal_code,
            spatiallocation as spatial_location,
            rowguid as row_guid,
            modifieddate as modified_date
        from source
    )
select *
from renamed