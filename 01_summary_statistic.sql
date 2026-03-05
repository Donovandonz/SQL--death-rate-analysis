-- Summary statistics by state --

SELECT 
    state,
    SUM(abs) as total_deaths,
    ROUND(AVG(rate), 2) as avg_death_rate,
    ROUND(MIN(rate), 2) as min_rate,
    ROUND(MAX(rate), 2) as max_rate
FROM death_staging
GROUP BY state
ORDER BY total_deaths DESC;