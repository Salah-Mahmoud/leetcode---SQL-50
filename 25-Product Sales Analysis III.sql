with order_of_years as (
    select
        product_id,
        year,
        DENSE_RANK () OVER (
            PARTITION BY product_id
            ORDER BY year
        ) years_order,
        quantity,
        price
    from
        Sales
)
select
    product_id,
    year as first_year,
    quantity,
    price
from order_of_years
where years_order=1

