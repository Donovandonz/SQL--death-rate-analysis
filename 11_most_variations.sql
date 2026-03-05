-- Districts with MOST variation in death rates --

SELECT 
    district,
    state,
    ROUND(AVG(rate), 2) as avg_rate,
    ROUND(STDDEV(rate), 2) as volatility,
    ROUND(MAX(rate) - MIN(rate), 2) as range_spread
FROM death_staging
GROUP BY district, state
ORDER BY volatility DESC
LIMIT 20;  -- Most volatile