-- Compare male vs female death rates by state --

SELECT 
    state,
    MAX(CASE WHEN sex = 'male' THEN avg_rate END) as male_rate,
    MAX(CASE WHEN sex = 'female' THEN avg_rate END) as female_rate,
    ROUND(MAX(CASE WHEN sex = 'male' THEN avg_rate END) - MAX(CASE WHEN sex = 'female' THEN avg_rate END), 2) as gender_gap
FROM 
    (SELECT 
        state,
        sex,
        ROUND(AVG(rate), 2) as avg_rate
    FROM death_staging
    GROUP BY state, sex)  as subquery
GROUP BY state
HAVING male_rate IS NOT NULL AND female_rate IS NOT NULL
ORDER BY gender_gap DESC;