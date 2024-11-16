WITH email_rank AS (
    SELECT
        id,
        email,
        DENSE_RANK() OVER (PARTITION BY email ORDER BY id) AS dense_rank
    FROM Person
)
DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM email_rank
    WHERE dense_rank > 1
);
