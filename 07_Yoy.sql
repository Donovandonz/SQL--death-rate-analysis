-- Calculate year-over-year change in death rates by state --

WITH yearly_data AS (
    SELECT 
        state,
        YEAR(date) as year,
        ROUND(AVG(rate), 2) as avg_rate,
        SUM(abs) as total_deaths
    FROM death_staging
    GROUP BY state, YEAR(date)
)
SELECT 
    state,
    year,
    avg_rate,
    total_deaths,
    LAG(avg_rate) OVER (PARTITION BY state ORDER BY year) as prev_year_rate,
    ROUND((avg_rate) - LAG(avg_rate) OVER (PARTITION BY state ORDER BY year), 2) as rate_change,
	ROUND((avg_rate - LAG(avg_rate) OVER (PARTITION BY state ORDER BY year)) / LAG(avg_rate) OVER (PARTITION BY state ORDER BY year), 3) * 100 as percent_change
FROM yearly_data
ORDER BY state, year;