WITH RankedOrders AS (
    SELECT
        customer_id,
        order_date,
        customer_pref_delivery_date,
        DENSE_RANK() OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS order_rank
    FROM Delivery
)

SELECT
    ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2) AS immediate_percentage
FROM RankedOrders
WHERE order_rank = 1;
