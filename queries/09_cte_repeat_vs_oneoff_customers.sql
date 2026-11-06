-- 9. CTE: Split customers into repeat buyers vs. one-off buyers, compare avg spend
WITH order_counts AS (
    SELECT
        c.customer_id,
        COUNT(i.invoice_id) AS num_orders,
        SUM(i.total) AS total_spent
    FROM customer c
    JOIN invoice i ON i.customer_id = c.customer_id
    GROUP BY c.customer_id
),
classified AS (
    SELECT
        *,
        CASE WHEN num_orders > 1 THEN 'repeat' ELSE 'one-off' END AS customer_type
    FROM order_counts
)
SELECT
    customer_type,
    COUNT(*) AS num_customers,
    ROUND(AVG(total_spent)::numeric, 2) AS avg_total_spent
FROM classified
GROUP BY customer_type;
