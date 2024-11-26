WITH cte_combined_requests AS (
    SELECT requester_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id
    FROM RequestAccepted
)
SELECT
    requester_id AS id,
    COUNT(*) AS num
FROM cte_combined_requests
GROUP BY requester_id
ORDER BY num DESC
LIMIT 1;
