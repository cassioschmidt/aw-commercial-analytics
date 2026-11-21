with
    source as (select * from {{ source("adventure_works", "person_person") }}),
    renamed as (
        select
            businessentityid as person_id,
            persontype as person_type,
            namestyle as is_eastern_name_style,
            title,
            firstname as first_name,
            middlename as middle_name,
            lastname as last_name,
            suffix,
            emailpromotion as email_promotion_code,
            additionalcontactinfo as additional_contact_info,
            demographics,
            rowguid as row_guid,
            modifieddate as modified_date
        from source
    )
select *
from renamed