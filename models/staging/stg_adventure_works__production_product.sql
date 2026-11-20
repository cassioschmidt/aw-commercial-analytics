with
    source as (select * from {{ source('adventure_works', 'production_product') }}),
    renamed as (
        select
            productid as product_id,
            name as product_name,
            productnumber as product_number,
            makeflag as is_made_in_house,
            finishedgoodsflag as is_finished_good,
            color,
            safetystocklevel as safety_stock_level,
            reorderpoint as reorder_point,
            standardcost::number(19, 4) as standard_cost,
            listprice::number(19, 4) as list_price,
            size,
            sizeunitmeasurecode as size_unit_measure_code,
            weightunitmeasurecode as weight_unit_measure_code,
            weight::number(18, 4) as weight,
            daystomanufacture as days_to_manufacture,
            productline as product_line,
            class,
            style,
            productsubcategoryid as product_subcategory_id,
            productmodelid as product_model_id,
            sellstartdate as sell_start_date,
            sellenddate as sell_end_date,
            rowguid as row_guid,
            modifieddate as modified_date
        from source
    )
select *
from renamed