-- Rank districts by death rate within each state --

SELECT 
    state,
    district,
    ROUND(AVG(rate), 2) as avg_rate,
    SUM(abs) as total_deaths,
    RANK() OVER (PARTITION BY state ORDER BY AVG(rate) DESC) as rank_in_state
FROM death_staging
GROUP BY state, district
ORDER BY state, rank_in_state;