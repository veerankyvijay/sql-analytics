-- 5. WINDOW FUNCTION: Rank tracks by length within each album (RANK)
SELECT
    al.title AS album,
    t.name AS track,
    t.milliseconds,
    RANK() OVER (PARTITION BY al.album_id ORDER BY t.milliseconds DESC) AS length_rank
FROM album al
JOIN track t ON t.album_id = al.album_id
ORDER BY al.title, length_rank
LIMIT 30;
