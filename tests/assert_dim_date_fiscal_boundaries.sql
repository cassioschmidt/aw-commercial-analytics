select full_date, fiscal_year, fiscal_quarter
from {{ ref("dim_date") }}
where
    (full_date = '2013-06-30' and (fiscal_year <> 2013 or fiscal_quarter <> 4))
    or (full_date = '2013-07-01' and (fiscal_year <> 2014 or fiscal_quarter <> 1))
    or (full_date = '2013-10-01' and fiscal_quarter <> 2)
    or (full_date = '2014-06-30' and (fiscal_year <> 2014 or fiscal_quarter <> 4))