-- Compare deaths by gender --

SELECT 
    sex,
    COUNT(*) as record_count,
    SUM(abs) as total_deaths,
    ROUND(AVG(rate), 2) as avg_rate,
    ROUND(MIN(rate), 2) as min_rate,
    ROUND(MAX(rate), 2) as max_rate
FROM death_staging
GROUP BY sex;