with
    source as (select * from {{ source("adventure_works", "sales_salesorderheader") }}),
    renamed as (
        select
            salesorderid as sales_order_id,
            revisionnumber as revision_number,
            orderdate as order_date,
            duedate as due_date,
            shipdate as ship_date,
            status,
            onlineorderflag as is_online_order,
            purchaseordernumber as purchase_order_number,
            accountnumber as account_number,
            customerid as customer_id,
            salespersonid as sales_person_id,
            territoryid as territory_id,
            billtoaddressid as bill_to_address_id,
            shiptoaddressid as ship_to_address_id,
            shipmethodid as ship_method_id,
            creditcardid as credit_card_id,
            creditcardapprovalcode as credit_card_approval_code,
            currencyrateid as currency_rate_id,
            subtotal::number(19, 4) as subtotal_amount,
            taxamt::number(19, 4) as tax_amount,
            freight::number(19, 4) as freight_amount,
            totaldue::number(19, 4) as total_due_amount,
            rowguid as row_guid,
            modifieddate as modified_date
        from source
    )
select *
from renamed
