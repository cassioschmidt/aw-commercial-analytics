with
    source as (select * from {{ source("adventure_works", "sales_salesperson") }}),
    renamed as (
        select
            businessentityid as sales_person_id,
            territoryid as territory_id,
            salesquota as sales_quota_amount,
            bonus as bonus_amount,
            commissionpct::number(10, 4) as commission_percent,
            salesytd::number(19, 4) as sales_year_to_date_amount,
            saleslastyear::number(19, 4) as sales_last_year_amount,
            rowguid as row_guid,
            modifieddate as modified_date
        from source
    )
select *
from renamed
