with 
source as (
    select * from {{ source("adventure_works", "sales_salespersonquotahistory") }}
),
renamed as (
    select
        businessentityid as sales_person_id,
        quotadate as quota_date,
        salesquota as sales_quota_amount,
        rowguid as row_guid,
        modifieddate as modified_date
    from source
)
select * from renamed
