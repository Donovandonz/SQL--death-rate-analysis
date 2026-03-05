CREATE DATABASE death_district_sex;
USE death_district_sex;


CREATE TABLE death_staging AS
SELECT * 
FROM death_district_sex;


SELECT *
FROM death_staging;


-- Delete unwanted Rows --

DELETE FROM death_staging
WHERE sex = 'both';


-- IDENTIFY QUALITY DATA ISSUES -- SUCH AS DUPLICATE --

SELECT
ROW_NUMBER() OVER(PARTITION BY `date`, state, district, sex, abs, rate) AS row_num
FROM death_staging;

WITH duplicate_cte AS
(SELECT
ROW_NUMBER() OVER(PARTITION BY `date`, state, district, sex, abs, rate) AS row_num
FROM death_staging)
SELECT *
FROM duplicate_cte
WHERE row_num >=1;


-- Check for NULL values in specific columns --

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN `date` IS NULL THEN 1 ELSE 0 END) AS null_date,
    SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS null_state,
    SUM(CASE WHEN district IS NULL THEN 1 ELSE 0 END) AS null_district,
    SUM(CASE WHEN sex IS NULL THEN 1 ELSE 0 END) AS null_dsex,
    SUM(CASE WHEN abs IS NULL THEN 1 ELSE 0 END) AS null_abs,
    SUM(CASE WHEN rate IS NULL THEN 1 ELSE 0 END) AS null_rate
FROM death_staging;


-- Standardize Text Formatting --

 UPDATE your_table_name
 SET gender = 
   CASE 
        WHEN UPPER(gender) IN ('M', 'MALE', 'MALE ') THEN 'Male'
        WHEN UPPER(gender) IN ('F', 'FEMALE', 'FEMALE ') THEN 'Female'
        WHEN UPPER(gender) IN ('O', 'OTHER', 'NON-BINARY') THEN 'Other'
        WHEN gender IS NULL OR LTRIM(RTRIM(gender)) = '' THEN 'Unknown'
        ELSE INITCAP(LTRIM(RTRIM(gender)))  -- Capitalize first letter
    END;


-- Convert date formats to YYYY-MM-DD --

ALTER TABLE your_table 
ADD COLUMN death_date DATE;

SELECT 
    date as original,
    STR_TO_DATE(date, '%d/%m/%Y') as converted_date,
    DATE_FORMAT(STR_TO_DATE(date, '%d/%m/%Y'), '%Y-%m-%d') as formatted_date
FROM death_staging;


UPDATE death_staging 
SET death_date = STR_TO_DATE(date, '%d/%m/%Y')
WHERE date IS NOT NULL AND date != '';

ALTER TABLE death_staging 
MODIFY COLUMN death_date DATE FIRST;

ALTER TABLE your_table
DROP COLUMN date;

ALTER TABLE death_staging 
CHANGE COLUMN donation_date date DATE;


-- Unique States --

SELECT DISTINCT state 
FROM death_staging;


-- Date range --

SELECT MIN(date), MAX(date) 
FROM death_staging;


-- Basic Overview --

SELECT 
    COUNT(*) as total_records,
    COUNT(DISTINCT state) as number_of_states,
    COUNT(DISTINCT district) as number_of_districts,
    MIN(date) as earliest_date,
    MAX(date) as latest_date,
    SUM(abs) as total_deaths,
    ROUND(AVG(rate), 2) as average_death_rate
FROM death_staging;


-- Summary statistics by state --

SELECT 
    state,
    SUM(abs) as total_deaths,
    ROUND(AVG(rate), 2) as avg_death_rate,
    ROUND(MIN(rate), 2) as min_rate,
    ROUND(MAX(rate), 2) as max_rate
FROM death_staging
GROUP BY state
ORDER BY total_deaths DESC;


-- 1. Analysis by Different Dimensions --

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


-- By district within a specific state --

SELECT 
    district,
    SUM(abs) as total_deaths,
    ROUND(AVG(rate), 2) as avg_rate
FROM death_staging
WHERE state = 'Sabah'
GROUP BY district
ORDER BY total_deaths DESC;


-- Time trend analysis by Yearly Trends --

SELECT 
    DATE_FORMAT(date, '%Y') as yearly,
    SUM(abs) as yearly_deaths,
    ROUND(AVG(rate), 2) as yearly_avg_rate
FROM death_staging
GROUP BY DATE_FORMAT(date, '%Y')
ORDER BY yearly;



-- Top/ Bottom Analysis --

-- Top 5 States with HIGHEST death rates --

SELECT 
    state,
    SUM(abs) as total_deaths,
    ROUND(AVG(rate), 2) as avg_rate
FROM death_staging
GROUP BY state
ORDER BY avg_rate DESC
LIMIT 5;


-- Top 5 States with LOWEST death rates --

SELECT 
    state,
    SUM(abs) as total_deaths,
    ROUND(AVG(rate), 2) as avg_rate
FROM death_staging
GROUP BY state
ORDER BY avg_rate ASC
LIMIT 5;



-- 2. Year-over-Year Change Analysis --

-- Calculate year-over-year change in death rates by state --

WITH yearly_data AS (
    SELECT 
        state,
        YEAR(date) as year,
        ROUND(AVG(rate), 2) as avg_rate,
        SUM(abs) as total_deaths
    FROM death_staging
    GROUP BY state, YEAR(date)
)
SELECT 
    state,
    year,
    avg_rate,
    total_deaths,
    LAG(avg_rate) OVER (PARTITION BY state ORDER BY year) as prev_year_rate,
    ROUND((avg_rate) - LAG(avg_rate) OVER (PARTITION BY state ORDER BY year), 2) as rate_change,
	ROUND((avg_rate - LAG(avg_rate) OVER (PARTITION BY state ORDER BY year)) / LAG(avg_rate) OVER (PARTITION BY state ORDER BY year), 3) * 100 as percent_change
FROM yearly_data
ORDER BY state, year;



-- 3. Gender Gap Analysis by State --

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


-- 4. District Ranking within States --

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


-- 5. Statistical Summary by District --

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



-- 6. Most and Least Volatile Districts --

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


-- Districts with LEAST variation in death rates --

SELECT 
    district,
    state,
    ROUND(AVG(rate), 2) as avg_rate,
    ROUND(STDDEV(rate), 2) as volatility,
    ROUND(MAX(rate) - MIN(rate), 2) as range_spread
FROM death_staging
GROUP BY district, state
ORDER BY volatility ASC
LIMIT 20;  -- LEAST volatile


-- 7. Gender Ratio Analysis --

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



-- 8. Correlation Between Rate and Absolute Numbers --

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
    MIN(rate) as min_rate,
    MAX(rate) as max_rate,
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




SELECT *
FROM death_staging;


