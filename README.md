# SQL--death-rate-analysis
💀 Malaysia Death Rate Analysis by District and Gender

---

## Dataset used
-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/death_district_sex.csv">RAW.death-rate-dataset</a>

---

## 📌 Project Overview

This project analyzes death rate patterns across Malaysia using SQL for data cleaning, transformation, and exploratory data analysis. The dataset contains death records by district, state, gender, and time period, enabling multi-dimensional analysis of mortality patterns.

---

## 🛢️ Database & Tools

| Component | Details |
|-----------|---------|
| **Database** | MySQL 8.0 |
| **Tool Used** | MySQL Workbench |
| **Techniques** | Data cleaning, CTEs, aggregations, date functions, filtering, grouping, window functions, CASE statements |

---

## 🎯 Project Objectives

- Clean and standardize raw death record data
- Analyze death rates by state, district, and gender
- Identify trends and patterns over time
- Calculate statistical measures (averages, volatility, trends)
- Generate actionable insights for public health planning

---

## 📊 Database Schema

### Table: `death_staging`

| Column | Data Type | Description |
|--------|-----------|-------------|
| date | DATE | Record date |
| state | VARCHAR | Malaysian state |
| district | VARCHAR | District within state |
| sex | VARCHAR | Male/Female |
| abs | INT | Absolute death count |
| rate | DECIMAL | Death rate per capita |

---

## 📊 Key Business Questions Answered

| # | Question | SQL File |
|:--:|----------|----------|
| 1 | | 1 | Summary statistics by state? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/01_customer_demographic.sql">SQL-query</a> |? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/01_customer_demographic.sql">SQL-query</a> |
| 2 | Compare deaths by gender? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/02_gender_analysis.sql">SQL-query</a> |
| 3 | Total deaths by district and average rate? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/03_most_popular_category.sql">SQL-query</a> |
| 4 | Total deaths yearly and avg yearly rate? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/04_seasonal_trends.sql">SQL-query</a> |
| 5 | Top 5 States with HIGHEST death rates? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/05_frequency_of_purchases.sql">SQL-query</a> |
| 6 |op 5 States with LOWEST death rates? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/06_customer_segment.sql">SQL-query</a> |
| 7 |  Year-over-year change in death rates by state? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/07_size_preferences.sql">SQL-query</a> |
| 8 | Male vs Female death rates by state? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/08_color_preferences.sql">SQL-query</a> |
| 9 | Highest districts Rank by death rate within each state? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/09_discount_impact.sql">SQL-query</a> |
| 10 | Statistics for each district? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/10_subscription_status.sql">SQL-query</a> |
| 11 | Districts with MOST variation in death rates? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/11_performance_by_location.sql">SQL-query</a> |
| 12 | Districts with LEAST variation in death rates? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/12_payment_method.sql">SQL-query</a>|
| 13 | Male-to-Female death ratio by state and year? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/13_review_rating.sql">SQL-query</a> |
| 14 | Compare rate categories with death counts? |-<a href="https://github.com/Donovandonz/SQL--shopping-behavior-analysis/blob/main/14_identify_repeat_purchase.sql">SQL-query</a> |


