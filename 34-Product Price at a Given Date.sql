WITH cte_date_rank AS (
    SELECT
        product_id,
        DENSE_RANK() OVER (
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS date_rank,
        new_price AS price
    FROM Products
    WHERE change_date <= '2019-08-16'

    UNION

    SELECT
        product_id,
        1 AS date_rank,
        10 AS price
    FROM Products
    WHERE product_id NOT IN (
        SELECT product_id
        FROM Products
        WHERE change_date <= '2019-08-16'
    )
)
SELECT
    product_id,
    price
FROM cte_date_rank
WHERE date_rank = 1;
