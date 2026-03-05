-- Calculate male-to-female death ratio by state and year --

SELECT 
    YEAR(d1.date) as year,
    d1.state,
    d1.district,
    d1.abs as male_deaths,
    d2.abs as female_deaths,
    ROUND(d1.abs / NULLIF(d2.abs, 0), 2) as male_to_female_ratio
FROM death_staging d1
JOIN death_staging d2 
    ON d1.state = d2.state 
    AND d1.district = d2.district 
    AND d1.date = d2.date
    AND d1.sex = 'male' 
    AND d2.sex = 'female'
ORDER BY year, state, district;