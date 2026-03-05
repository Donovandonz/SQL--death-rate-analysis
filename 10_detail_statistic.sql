-- Detailed statistics for each district --

SELECT 
    district,
    state,
    ROUND(MIN(rate), 2) as min_rate,
    ROUND(MAX(rate), 2) as max_rate,
    ROUND(AVG(rate), 2) as mean_rate,
    ROUND(STDDEV(rate), 2) as std_dev_rate,
    SUM(abs) as total_deaths,
    ROUND(AVG(abs), 1) as avg_monthly_deaths
FROM death_staging
GROUP BY district, state
ORDER BY std_dev_rate DESC;