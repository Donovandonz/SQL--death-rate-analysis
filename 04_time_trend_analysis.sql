-- Time trend analysis by Yearly Trends --

SELECT 
    DATE_FORMAT(date, '%Y') as yearly,
    SUM(abs) as yearly_deaths,
    ROUND(AVG(rate), 2) as yearly_avg_rate
FROM death_staging
GROUP BY DATE_FORMAT(date, '%Y')
ORDER BY yearly;
