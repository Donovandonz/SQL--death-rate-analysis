-- By district within a specific state --

SELECT 
    district,
    SUM(abs) as total_deaths,
    ROUND(AVG(rate), 2) as avg_rate
FROM death_staging
WHERE state = 'Sabah'
GROUP BY district
ORDER BY total_deaths DESC;