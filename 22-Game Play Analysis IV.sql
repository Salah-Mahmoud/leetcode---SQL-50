WITH cte_filter AS (
    SELECT
        player_id,
        event_date,
        DENSE_RANK() OVER (
            PARTITION BY player_id
            ORDER BY event_date
        ) AS dense_rank
    FROM
        Activity
)

SELECT
    ROUND(COUNT(DISTINCT A1.player_id) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
    cte_filter A1
JOIN
    cte_filter A2
ON
    A1.player_id = A2.player_id
    AND A1.dense_rank = 1
    AND A2.dense_rank = 2
    AND A2.event_date = A1.event_date + INTERVAL '1 day';
