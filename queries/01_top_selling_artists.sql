-- 1. JOIN: Top 10 artists by total sales revenue
-- Joins artist -> album -> track -> invoice_line, sums revenue per artist.
SELECT
    ar.name AS artist,
    ROUND(SUM(il.unit_price * il.quantity)::numeric, 2) AS total_revenue
FROM artist ar
JOIN album al ON al.artist_id = ar.artist_id
JOIN track t ON t.album_id = al.album_id
JOIN invoice_line il ON il.track_id = t.track_id
GROUP BY ar.name
ORDER BY total_revenue DESC
LIMIT 10;
