-- 3. JOIN + aggregate: Track count and average duration per genre
SELECT
    g.name AS genre,
    COUNT(t.track_id) AS num_tracks,
    ROUND(AVG(t.milliseconds) / 60000.0, 2) AS avg_duration_minutes
FROM genre g
JOIN track t ON t.genre_id = g.genre_id
GROUP BY g.name
ORDER BY num_tracks DESC;
