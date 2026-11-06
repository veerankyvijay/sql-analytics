-- 10. CTE + WINDOW FUNCTION: Sales rep performance, ranked, with gap to the top performer
WITH rep_sales AS (
    SELECT
        e.employee_id,
        e.first_name || ' ' || e.last_name AS rep,
        SUM(i.total) AS total_sales
    FROM employee e
    JOIN customer c ON c.support_rep_id = e.employee_id
    JOIN invoice i ON i.customer_id = c.customer_id
    GROUP BY e.employee_id, rep
)
SELECT
    rep,
    ROUND(total_sales::numeric, 2) AS total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank,
    ROUND((MAX(total_sales) OVER () - total_sales)::numeric, 2) AS gap_to_top
FROM rep_sales
ORDER BY sales_rank;
