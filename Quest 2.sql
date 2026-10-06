WITH product_stats AS (
    SELECT
        product_id,
        COUNT(*) AS total_views,
        COUNT(DISTINCT user_id) AS number_of_unique_users
    FROM product_views
    GROUP BY product_id
),
ranked_products AS (
    SELECT
        product_id,
        total_views,
        number_of_unique_users,
        DENSE_RANK() OVER (ORDER BY total_views DESC) AS rnk
    FROM product_stats
)
SELECT
    product_id,
    total_views,
    number_of_unique_users
FROM ranked_products
WHERE rnk <= 3
ORDER BY total_views DESC, product_id;