-- 4. WINDOW FUNCTION: Running total of monthly revenue (year-to-date style)
SELECT
    month,
    monthly_revenue,
    ROUND(SUM(monthly_revenue) OVER (ORDER BY month)::numeric, 2) AS running_total
FROM (
    SELECT
        DATE_TRUNC('month', i.invoice_date)::date AS month,
        SUM(i.total) AS monthly_revenue
    FROM invoice i
    GROUP BY month
) monthly
ORDER BY month;
