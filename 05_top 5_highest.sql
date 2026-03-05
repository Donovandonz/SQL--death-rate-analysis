-- Top 5 States with HIGHEST death rates --

SELECT 
    state,
    SUM(abs) as total_deaths,
    ROUND(AVG(rate), 2) as avg_rate
FROM death_staging
GROUP BY state
ORDER BY avg_rate DESC
LIMIT 5;