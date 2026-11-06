-- 7. CTE (common table expression): Top-spending customer in each country
WITH customer_totals AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer,
        c.country,
        SUM(i.total) AS total_spent
    FROM customer c
    JOIN invoice i ON i.customer_id = c.customer_id
    GROUP BY c.customer_id, customer, c.country
),
ranked AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY country ORDER BY total_spent DESC) AS rnk
    FROM customer_totals
)
SELECT country, customer, ROUND(total_spent::numeric, 2) AS total_spent
FROM ranked
WHERE rnk = 1
ORDER BY total_spent DESC;
