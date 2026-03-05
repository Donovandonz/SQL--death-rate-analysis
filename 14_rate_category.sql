-- Compare rate categories with death counts --

SELECT 
    state, district,
    CASE 
		WHEN rate < 5 THEN 'Very Low (0-5)'
        WHEN rate BETWEEN 5 AND 10 THEN 'Low (5-10)'
        WHEN rate BETWEEN 10 AND 15 THEN 'Medium-Low (10-15)'
        WHEN rate BETWEEN 15 AND 20 THEN 'Medium (15-20)'
        WHEN rate BETWEEN 20 AND 25 THEN 'Medium-High (20-25)'
        WHEN rate BETWEEN 25 AND 30 THEN 'High (25-30)'
        ELSE 'Very High (>30)'
    END as rate_category,
    ROUND(AVG(abs), 2) as avg_deaths,
    ROUND(MIN(rate), 2) as min_rate,
    ROUND(MAX(rate), 2) as max_rate,
    SUM(abs) as total_deaths
FROM death_staging
WHERE state = 'Sabah'
GROUP BY state, district, 
    CASE 
        WHEN rate < 5 THEN 'Very Low (0-5)'
        WHEN rate BETWEEN 5 AND 10 THEN 'Low (5-10)'
        WHEN rate BETWEEN 10 AND 15 THEN 'Medium-Low (10-15)'
        WHEN rate BETWEEN 15 AND 20 THEN 'Medium (15-20)'
        WHEN rate BETWEEN 20 AND 25 THEN 'Medium-High (20-25)'
        WHEN rate BETWEEN 25 AND 30 THEN 'High (25-30)'
        ELSE 'Very High (>30)'
    END
ORDER BY state, rate_category;