# sql-analytics

Week 1 of a 6-week upskilling plan: PostgreSQL + SQL depth (joins, window functions, CTEs).

## Dataset
[Chinook](https://github.com/lerocha/chinook-database) — a sample digital music store database (artists, albums, tracks, customers, invoices, employees). Loaded from `data/chinook_postgres.sql` into a local PostgreSQL 17 database named `chinook`.

To reproduce:
```
psql -U postgres -c "CREATE DATABASE chinook;"
psql -U postgres -d chinook -f data/chinook_postgres.sql
```

## Queries (`queries/`)
All 10 run against the `chinook` database and were verified with `psql`.

| # | File | Concept | What it answers |
|---|---|---|---|
| 1 | `01_top_selling_artists.sql` | JOIN | Top 10 artists by revenue |
| 2 | `02_customer_country_join.sql` | JOIN | Top customers by spend, with country |
| 3 | `03_genre_track_counts.sql` | JOIN + aggregate | Track count & avg length per genre |
| 4 | `04_running_total_revenue.sql` | Window function | Monthly revenue running total |
| 5 | `05_rank_tracks_per_album.sql` | Window function (RANK) | Longest tracks per album |
| 6 | `06_customer_spend_vs_country_avg.sql` | Window function | Customer spend vs. their country's average |
| 7 | `07_cte_top_customer_per_country.sql` | CTE + RANK | Top-spending customer per country |
| 8 | `08_cte_genre_revenue_share.sql` | CTE | Each genre's % share of total revenue |
| 9 | `09_cte_repeat_vs_oneoff_customers.sql` | CTE + CASE | Repeat vs. one-off customer spend comparison |
| 10 | `10_cte_window_employee_sales_performance.sql` | CTE + window | Sales rep ranking with gap to top performer |

## Notes
- A common table expression (CTE) is a named sub-query (`WITH x AS (...)`) used to break a query into readable steps.
- Window functions (`RANK() OVER (...)`, `SUM(...) OVER (...)`) compute values across a set of rows without collapsing them into one row, unlike `GROUP BY`.
