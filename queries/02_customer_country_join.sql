-- 2. JOIN: Revenue and order count per customer, with their country
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer,
    c.country,
    COUNT(DISTINCT i.invoice_id) AS num_orders,
    ROUND(SUM(i.total)::numeric, 2) AS total_spent
FROM customer c
JOIN invoice i ON i.customer_id = c.customer_id
GROUP BY c.customer_id, customer, c.country
ORDER BY total_spent DESC
LIMIT 15;
