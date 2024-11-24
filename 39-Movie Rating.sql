WITH highest_users AS (
    SELECT
        U.name AS results
    FROM
        MovieRating M
    JOIN Users U
        ON M.user_id = U.user_id
    GROUP BY
        U.name
    ORDER BY
        COUNT(*) DESC, U.name
    LIMIT 1
),
highest_movies AS (
    SELECT
        M.title AS results
    FROM
        MovieRating R
    JOIN Movies M
        ON R.movie_id = M.movie_id
    WHERE
        created_at >= '2020-02-01' AND created_at < '2020-03-01'
    GROUP BY
        M.title
    ORDER BY
        AVG(R.rating) DESC, M.title
    LIMIT 1
)
SELECT results
FROM highest_users
UNION ALL
SELECT results
FROM highest_movies;
