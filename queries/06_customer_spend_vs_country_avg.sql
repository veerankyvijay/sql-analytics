-- 6. WINDOW FUNCTION: Each customer's spend vs. their country's average spend
SELECT
    c.country,
    c.first_name || ' ' || c.last_name AS customer,
    ROUND(SUM(i.total)::numeric, 2) AS customer_spend,
    ROUND(AVG(SUM(i.total)) OVER (PARTITION BY c.country)::numeric, 2) AS country_avg_spend
FROM customer c
JOIN invoice i ON i.customer_id = c.customer_id
GROUP BY c.country, c.customer_id, customer
ORDER BY c.country, customer_spend DESC;
