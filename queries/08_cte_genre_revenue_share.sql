-- 8. CTE: Each genre's revenue share (%) of total store revenue
WITH genre_revenue AS (
    SELECT
        g.name AS genre,
        SUM(il.unit_price * il.quantity) AS revenue
    FROM genre g
    JOIN track t ON t.genre_id = g.genre_id
    JOIN invoice_line il ON il.track_id = t.track_id
    GROUP BY g.name
),
total AS (
    SELECT SUM(revenue) AS grand_total FROM genre_revenue
)
SELECT
    gr.genre,
    ROUND(gr.revenue::numeric, 2) AS revenue,
    ROUND((gr.revenue / t.grand_total * 100)::numeric, 2) AS pct_of_total
FROM genre_revenue gr, total t
ORDER BY pct_of_total DESC;
