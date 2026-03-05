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
| 1 | Summary statistics by state? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/01_summary_statistic.sql">SQL-query</a> |
| 2 | Compare deaths by gender? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/02_deaths_by_gender.sql">SQL-query</a> |
| 3 | Total deaths by district and average rate? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/03_avg_rate_by_district.sql">SQL-query</a> |
| 4 | Total deaths yearly and avg yearly rate? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/04_time_trend_analysis.sql">SQL-query</a> |
| 5 | Top 5 States with HIGHEST death rates? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/05_top%205_highest.sql">SQL-query</a> |
| 6 | Top 5 States with LOWEST death rates? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/06_top_5_lowest_state.sql">SQL-query</a> |
| 7 |  Year-over-year change in death rates by state? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/07_Yoy.sql">SQL-query</a> |
| 8 | Male vs Female death rates by state? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/08_MvsF_death_rates.sql">SQL-query</a> |
| 9 | Highest districts Rank by death rate within each state? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/09_rank_district.sql">SQL-query</a> |
| 10 | Statistics for each district? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/10_detail_statistic.sql">SQL-query</a> |
| 11 | Districts with MOST variation in death rates? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/11_most_variations.sql">SQL-query</a> |
| 12 | Districts with LEAST variation in death rates? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/12_least_variations.sql">SQL-query</a>|
| 13 | Male-to-Female death ratio by state and year? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/13_male_to_female_ratio.sql">SQL-query</a> |
| 14 | Compare rate categories with death counts? |-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/14_rate_category.sql">SQL-query</a> |


---

# 1. Summary statistics by state? 
<img width="501" height="366" alt="Screenshot 2026-03-05 102710" src="https://github.com/user-attachments/assets/6d593aa6-df02-4a0f-b566-76af1a5ee617" />

## 📊 State-Level Death Statistics Analysis

### Summary Statistics by State

| State | Total Deaths | Avg Death Rate | Min Rate | Max Rate | Rate Range |
|-------|--------------|----------------|----------|----------|------------|
| Selangor | 132,917 | 5.48 | 1.93 | 12.14 | 10.21 |
| Johor | 97,576 | 7.02 | 3.13 | 10.65 | 7.52 |
| Perak | 82,411 | 8.65 | 3.90 | 14.54 | 10.64 |
| Sabah | 67,507 | 5.70 | 1.06 | 14.26 | 13.20 |
| Kedah | 66,393 | 8.30 | 4.25 | 11.98 | 7.73 |
| Sarawak | 64,452 | 8.61 | 1.74 | 27.82 | 26.08 |
| Kelantan | 50,129 | 6.80 | 3.89 | 10.15 | 6.26 |
| Pulau Pinang | 49,891 | 7.01 | 4.49 | 10.02 | 5.53 |
| W.P. Kuala Lumpur | 41,260 | 5.19 | 3.81 | 7.36 | 3.55 |
| Pahang | 40,569 | 6.76 | 3.30 | 11.17 | 7.87 |
| Negeri Sembilan | 33,032 | 8.28 | 4.01 | 11.99 | 7.98 |
| Terengganu | 31,740 | 6.85 | 3.50 | 10.44 | 6.94 |
| Melaka | 25,343 | 6.57 | 4.78 | 8.73 | 3.95 |
| Perlis | 8,777 | 7.60 | 6.15 | 9.32 | 3.17 |
| W.P. Labuan | 1,556 | 4.01 | 2.88 | 6.07 | 3.19 |
| W.P. Putrajaya | 1,013 | 2.20 | 1.65 | 2.82 | 1.17 |


## 🔍 Key Findings

### 🏆 **Top 5 States by Total Deaths**
| Rank | State | Total Deaths | % of National |
|------|-------|--------------|---------------|
| 1 | Selangor | 132,917 | 19.8% |
| 2 | Johor | 97,576 | 14.5% |
| 3 | Perak | 82,411 | 12.3% |
| 4 | Sabah | 67,507 | 10.1% |
| 5 | Kedah | 66,393 | 9.9% |

> **Insight**: Selangor alone accounts for nearly **20%** of total deaths, reflecting its status as Malaysia's most populous state.

---

# 2. Compare deaths by gender?
<img width="490" height="75" alt="Screenshot 2026-03-05 103214" src="https://github.com/user-attachments/assets/19b74f21-3a2f-4de0-99dc-c6d6faaf7e81" />


## 👥 Gender-Based Death Analysis

### Summary Statistics by Gender

| Sex | Record Count | Total Deaths | Avg Rate | Min Rate | Max Rate | Rate Range |
|-----|--------------|--------------|----------|----------|----------|------------|
| Female | 627 | 340,337 | 6.55 | 1.06 | 18.97 | 17.91 |
| Male | 627 | 454,229 | 7.98 | 1.24 | 27.82 | 26.58 |
| **Difference** | **Equal** | **+113,892** | **+1.43** | **+0.18** | **+8.85** | **+8.67** |

---

## 🔍 Key Findings

### 📊 **Gender Disparity Overview**

| Metric | Female | Male | Gap | % Higher (Male) |
|--------|--------|------|-----|------------------|
| Total Deaths | 340,337 | 454,229 | +113,892 | **33.5%** |
| Average Rate | 6.55 | 7.98 | +1.43 | **21.8%** |
| Maximum Rate | 18.97 | 27.82 | +8.85 | **46.7%** |
| Minimum Rate | 1.06 | 1.24 | +0.18 | **17.0%** |

### 🎯 **Major Insights**

#### 1. **Significant Male Mortality Gap**
> **Finding**: Males account for **454,229 deaths** vs females at **340,337 deaths** — a difference of **113,892 lives**.

**Implication**: Malaysian males face **33.5% higher mortality** burden compared to females.

#### 2. **Higher Average Death Rate for Males**
> **Finding**: Male death rate averages **7.98** vs female **6.55** — a **1.43 point gap**.

**Implication**: Males consistently show higher mortality risk across most districts and time periods.

#### 3. **Extreme Values in Male Population**
> **Finding**: Male maximum rate reaches **27.82** compared to female maximum of **18.97** — a **46.7% higher peak**.

**Implication**: Males experience more extreme mortality events or higher-risk environments.

#### 4. **Identical Record Counts**
> **Finding**: Both genders have exactly **627 records**, indicating balanced data collection.

**Implication**: The gender comparison is statistically valid with equal sample sizes.

---

# 3. Total deaths by district and average rate?
<img width="277" height="535" alt="Screenshot 2026-03-05 103503" src="https://github.com/user-attachments/assets/98fa4411-adb0-47af-97be-237d3a298a22" />

## 📍 Sabah District-Level Death Analysis

### Summary Statistics by District

| District | Total Deaths | Avg Rate | Category |
|----------|--------------|----------|----------|
| Kota Kinabalu | 7,938 | 3.91 | Urban Center |
| Sandakan | 7,283 | 4.09 | Urban Center |
| Tawau | 6,512 | 4.29 | Urban Center |
| Tuaran | 3,870 | 7.03 | Semi-Urban |
| Papar | 3,867 | 6.31 | Semi-Urban |
| Keningau | 3,289 | 5.36 | Interior |
| Kota Belud | 3,239 | 7.47 | Rural |
| Lahad Datu | 3,238 | 3.45 | Urban Center |
| Semporna | 3,039 | 4.48 | Coastal |
| Penampang | 2,950 | 4.46 | Suburban |
| Beaufort | 2,658 | 8.66 | Rural |
| Kudat | 2,472 | 7.05 | Rural |
| Ranau | 2,258 | 6.51 | Highland |
| Kota Marudu | 2,228 | 7.83 | Rural |
| Tenom | 1,642 | 7.87 | Interior |
| Pitas | 1,429 | 9.55 | Rural |
| Putatan | 1,383 | 4.94 | Suburban |
| Beluran | 1,353 | 4.23 | Rural |
| Sipitang | 1,043 | 6.80 | Coastal |
| Tambunan | 1,041 | 8.10 | Highland |
| Kuala Penyu | 1,029 | 10.76 | Coastal |
| Kunak | 972 | 3.47 | Coastal |
| Kinabatangan | 946 | 1.66 | Rural |
| Nabawan | 595 | 5.07 | Interior |
| Tongod | 547 | 3.15 | Interior |
| Kalabakan | 347 | 2.27 | Rural |
| Telupid | 339 | 3.72 | Rural |

---

## 🔍 Key Findings

### 🏆 **Top 5 Districts by Total Deaths**
| Rank | District | Total Deaths | % of Sabah | Type |
|------|----------|--------------|------------|------|
| 1 | Kota Kinabalu | 7,938 | 11.8% | Capital City |
| 2 | Sandakan | 7,283 | 10.8% | Major Town |
| 3 | Tawau | 6,512 | 9.6% | Major Town |
| 4 | Tuaran | 3,870 | 5.7% | Semi-Urban |
| 5 | Papar | 3,867 | 5.7% | Semi-Urban |

> **Insight**: The top 3 urban districts (Kota Kinabalu, Sandakan, Tawau) account for **32.2%** of Sabah's total deaths, reflecting population concentration.

### 📈 **Highest Death Rates (Most Critical)**
| Rank | District | Avg Rate | Risk Level |
|------|----------|----------|------------|
| 1 | Kuala Penyu | 10.76 | **Extreme** |
| 2 | Pitas | 9.55 | **Critical** |
| 3 | Beaufort | 8.66 | **High** |
| 4 | Tambunan | 8.10 | **High** |
| 5 | Tenom | 7.87 | **High** |
| 6 | Kota Marudu | 7.83 | **High** |
| 7 | Kota Belud | 7.47 | **Elevated** |

> **Insight**: Kuala Penyu has the highest death rate in Sabah at **10.76** — nearly **3x higher** than Kota Kinabalu.

### 📉 **Lowest Death Rates (Best Outcomes)**
| Rank | District | Avg Rate | Type |
|------|----------|----------|------|
| 1 | Kinabatangan | 1.66 | Rural |
| 2 | Kalabakan | 2.27 | Rural |
| 3 | Tongod | 3.15 | Interior |
| 4 | Kunak | 3.47 | Coastal |
| 5 | Lahad Datu | 3.45 | Urban |

> **Insight**: Kinabatangan has remarkably low death rate (**1.66**) — potential best practices worth studying.

---

# 4.  Total deaths yearly and avg yearly rate?
<img width="288" height="113" alt="Screenshot 2026-03-05 103720" src="https://github.com/user-attachments/assets/d3a6757e-0508-4e3a-bdd8-7985a1396068" />

## 📈 Yearly Death Trends Analysis (2020-2023)

### Summary Statistics by Year

| Year | Total Deaths | Yearly Avg Rate | YoY Change (Deaths) | YoY Change (Rate) |
|------|--------------|-----------------|---------------------|-------------------|
| 2020 | 166,507 | 6.45 | — | — |
| 2021 | 224,569 | 7.90 | +58,062 (+34.9%) | +1.45 (+22.5%) |
| 2022 | 206,525 | 7.60 | -18,044 (-8.0%) | -0.30 (-3.8%) |
| 2023 | 196,965 | 7.07 | -9,560 (-4.6%) | -0.53 (-7.0%) |

## 💡 Key Insights

### 1. **Mortality Wave Pattern**
> **Insight**: The data shows a clear **surge (2021) followed by gradual decline (2022-2023)**.

**Implication**: Healthcare systems should prepare for similar mortality patterns in future health crises.

### 2. **Rate vs Volume Disconnect**
| Year | Deaths | Rate | Ratio (Deaths/Rate) |
|------|--------|------|---------------------|
| 2020 | 166,507 | 6.45 | 25,815 |
| 2021 | 224,569 | 7.90 | 28,426 |
| 2022 | 206,525 | 7.60 | 27,175 |
| 2023 | 196,965 | 7.07 | 27,859 |

> **Finding**: The deaths-to-rate ratio increased post-2020, suggesting **population growth or demographic shifts** affecting raw death counts.

### 3. **Recovery Trajectory**
> **Insight**: The 12.3% decline from 2021 peak shows strong improvement, but rates remain elevated vs 2020.

**Implication**: Lingering health factors continue affecting mortality.

### 4. **2023 Plateau**
> **Insight**: 2023 decline (-4.6%) is slower than 2022 (-8.0%), suggesting **stabilization at a new normal**.

**Implication**: Mortality may have found a new equilibrium above pre-surge levels.

---

## 📈 Trend Metrics

| Metric | Value | Interpretation |
|--------|-------|----------------|
| **Peak Year** | 2021 | Highest mortality |
| **Lowest Year** | 2020 | Baseline period |
| **Total Decline from Peak** | -27,604 (-12.3%) | Strong recovery |
| **Years to Recover** | 2+ years (2022-2023) | Ongoing |
| **2023 vs 2020** | +30,458 (+18.3%) | Still elevated |

---

# 5.  Top 5 States with HIGHEST death rates?
<img width="292" height="141" alt="Screenshot 2026-03-05 104116" src="https://github.com/user-attachments/assets/b9af9bea-2893-4f48-a367-e79c41ae103c" />

## ⚠️ Top 5 States with HIGHEST Death Rates

### Summary Statistics

| Rank | State | Total Deaths | Avg Death Rate | Risk Level |
|------|-------|--------------|----------------|------------|
| 🥇 | Perak | 82,411 | **8.65** | 🔴 **Highest** |
| 🥈 | Sarawak | 64,452 | **8.61** | 🔴 Critical |
| 🥉 | Kedah | 66,393 | **8.30** | 🟠 High |
| 4 | Negeri Sembilan | 33,032 | **8.28** | 🟠 High |
| 5 | Perlis | 8,777 | **7.60** | 🟡 Elevated |

---

## 🔍 Key Findings

### 📊 **The Top 5 at a Glance**

| State | Deaths | Rate | National Average* | % Above Avg |
|-------|--------|------|-------------------|-------------|
| Perak | 82,411 | 8.65 | 6.72 | **+28.7%** |
| Sarawak | 64,452 | 8.61 | 6.72 | **+28.1%** |
| Kedah | 66,393 | 8.30 | 6.72 | **+23.5%** |
| Negeri Sembilan | 33,032 | 8.28 | 6.72 | **+23.2%** |
| Perlis | 8,777 | 7.60 | 6.72 | **+13.1%** |

*\*National average calculated from all states = ~6.72*

---

## 🎯 Major Insights

### 1. **Perak Leads with Highest Mortality**
> **Finding**: Perak has the **highest death rate in Malaysia at 8.65** — **28.7% above national average**.

**Implication**: Perak requires immediate public health attention and resource allocation.

### 2. **Northern States Cluster**
| Northern States | Rate | Status |
|-----------------|------|--------|
| Perak | 8.65 | 🔴 Highest |
| Kedah | 8.30 | 🟠 High |
| Perlis | 7.60 | 🟡 Elevated |

> **Finding**: Three northern states (Perak, Kedah, Perlis) appear in top 5, suggesting a **regional health challenge**.

### 3. **East Malaysia Representation**
> **Finding**: Sarawak (8.61) ranks **2nd highest nationally**, making it the top performer in East Malaysia for mortality.

**Implication**: Sarawak's high rate warrants investigation into rural healthcare access in Borneo.

### 4. **Small State, Big Rate**
> **Finding**: Perlis has the **smallest population** among top 5 (8,777 deaths) but **5th highest rate** (7.60).

---

# 6.  Top 5 States with LOWEST death rates?
<img width="307" height="133" alt="Screenshot 2026-03-05 104338" src="https://github.com/user-attachments/assets/d223f7a8-ec78-4822-b911-5bf2909d58be" />

## ✅ Top 5 States with LOWEST Death Rates

### Summary Statistics

| Rank | State | Total Deaths | Avg Death Rate | Risk Level |
|------|-------|--------------|----------------|------------|
| 🥇 | W.P. Putrajaya | 1,013 | **2.20** | 🟢 **Lowest** |
| 🥈 | W.P. Labuan | 1,556 | **4.01** | 🟢 Very Low |
| 🥉 | W.P. Kuala Lumpur | 41,260 | **5.19** | 🟢 Low |
| 4 | Selangor | 132,917 | **5.48** | 🟢 Low-Moderate |
| 5 | Sabah | 67,507 | **5.70** | 🟢 Low-Moderate |

---

## 🔍 Key Findings

### 📊 **The Top 5 at a Glance**

| State | Deaths | Rate | National Average* | % Below Avg |
|-------|--------|------|-------------------|-------------|
| W.P. Putrajaya | 1,013 | 2.20 | 6.72 | **-67.3%** |
| W.P. Labuan | 1,556 | 4.01 | 6.72 | **-40.3%** |
| W.P. Kuala Lumpur | 41,260 | 5.19 | 6.72 | **-22.8%** |
| Selangor | 132,917 | 5.48 | 6.72 | **-18.5%** |
| Sabah | 67,507 | 5.70 | 6.72 | **-15.2%** |

*\*National average calculated from all states = ~6.72*

---

## 🎯 Major Insights

### 1. **Federal Territories Dominate**
| Federal Territory | Rate | Rank |
|-------------------|------|------|
| W.P. Putrajaya | 2.20 | 🥇 1st |
| W.P. Labuan | 4.01 | 🥈 2nd |
| W.P. Kuala Lumpur | 5.19 | 🥉 3rd |

> **Finding**: All three Federal Territories rank in the **top 3 lowest death rates** nationally, demonstrating the advantage of administrative centers.

### 2. **Putrajaya's Outstanding Performance**
> **Finding**: Putrajaya has the **lowest death rate in Malaysia at 2.20** — an remarkable **67.3% below national average**.

**Implication**: Putrajaya serves as a **model for best practices** in healthcare and mortality management.

### 3. **Population Center Paradox**
| State | Deaths | Rate | Profile |
|-------|--------|------|---------|
| Selangor | 132,917 | 5.48 | **Highest volume + Low rate** |
| Sabah | 67,507 | 5.70 | **High volume + Low rate** |

> **Finding**: Selangor (Malaysia's most populous state) manages the **highest death volume (132,917)** while maintaining the **4th lowest rate (5.48)** — an impressive achievement.

### 4. **Sabah's Surprising Position**
> **Finding**: Despite being perceived as having healthcare challenges, Sabah ranks **5th lowest** in death rate (5.70).

**Implication**: Sabah's rural healthcare systems may be more effective than commonly perceived.

---

# 7.  Year-over-year change in death rates by state?
<img width="672" height="556" alt="Screenshot 2026-03-05 104611" src="https://github.com/user-attachments/assets/1ae4d5b5-e392-4feb-a158-96d11eac8e61" />

## 📊 Year-over-Year Death Rate Analysis by State (2020-2023)

### Summary Data by State

| State | 2020 Rate | 2021 Rate | 2022 Rate | 2023 Rate | 2020-2021 Change | 2021-2022 Change | 2022-2023 Change | Overall Trend |
|-------|-----------|-----------|-----------|-----------|-------------------|-------------------|-------------------|---------------|
| Johor | 6.02 | 7.62 | 7.46 | 6.97 | 🔺 +26.6% | 🔻 -2.1% | 🔻 -6.6% | 📈⬇️ Peak then decline |
| Kedah | 7.02 | 9.05 | 8.92 | 8.22 | 🔺 +28.9% | 🔻 -1.4% | 🔻 -7.8% | 📈⬇️ Peak then decline |
| Kelantan | 6.08 | 7.50 | 7.30 | 6.27 | 🔺 +23.4% | 🔻 -2.7% | 🔻 -14.1% | 📈⬇️ Sharp decline |
| Melaka | 5.63 | 7.28 | 7.03 | 6.35 | 🔺 +29.3% | 🔻 -3.4% | 🔻 -9.7% | 📈⬇️ Peak then decline |
| Negeri Sembilan | 7.17 | 9.09 | 8.81 | 8.04 | 🔺 +26.8% | 🔻 -3.1% | 🔻 -8.7% | 📈⬇️ Peak then decline |
| Pahang | 5.87 | 6.96 | 7.39 | 6.83 | 🔺 +18.6% | 🔺 +6.2% | 🔻 -7.6% | 📈⬆️⬇️ Late peak |
| Perak | 7.43 | 9.13 | 9.40 | 8.57 | 🔺 +22.9% | 🔺 +3.0% | 🔻 -8.8% | 📈⬆️⬇️ Late peak |
| Perlis | 6.85 | 7.77 | 8.36 | 7.41 | 🔺 +13.4% | 🔺 +7.6% | 🔻 -11.4% | 📈⬆️⬇️ Late peak |
| Pulau Pinang | 5.98 | 7.88 | 7.32 | 6.85 | 🔺 +31.8% | 🔻 -7.1% | 🔻 -6.4% | 📈⬇️ Sharp peak |
| Sabah | 5.11 | 6.20 | 5.90 | 5.54 | 🔺 +21.3% | 🔻 -4.8% | 🔻 -6.1% | 📈⬇️ Moderate |
| Sarawak | 8.41 | 9.22 | 8.54 | 8.21 | 🔺 +9.6% | 🔻 -7.4% | 🔻 -3.9% | 📈⬇️ High baseline |
| Selangor | 4.32 | 6.57 | 5.65 | 5.38 | 🔺 +52.1% | 🔻 -14.0% | 🔻 -4.8% | 📈⬇️ Extreme spike |
| Terengganu | 6.03 | 7.36 | 7.42 | 6.59 | 🔺 +22.1% | 🔺 +0.8% | 🔻 -11.2% | 📈⬆️⬇️ Late peak |
| W.P. Kuala Lumpur | 4.17 | 6.75 | 5.05 | 4.78 | 🔺 +61.9% | 🔻 -25.2% | 🔻 -5.3% | 📈⬇️ Extreme spike |
| W.P. Labuan | 3.29 | 5.36 | 4.04 | 3.35 | 🔺 +62.9% | 🔻 -24.6% | 🔻 -17.1% | 📈⬇️ Extreme spike |
| W.P. Putrajaya | 1.93 | 2.32 | 2.17 | 2.40 | 🔺 +20.2% | 🔻 -6.5% | 🔺 +10.6% | 📈⬇️⬆️ Stable |

---

## 🔍 Key Findings

### 🎯 **The 2021 Mortality Surge**

| Metric | Value |
|--------|-------|
| **States with 2021 Peaks** | **15 out of 16 states** (94%) |
| **States with 2022 Peaks** | Pahang, Perak, Perlis, Terengganu (4 states) |
| **States with Continued 2023 Increase** | W.P. Putrajaya (only) |

> **Finding**: **15 out of 16 states** recorded their highest death rates in **2021**, indicating a nationwide mortality event.

---

## 📈 **Biggest 2020-2021 Spikes (Top 5)**

| Rank | State | 2020 Rate | 2021 Rate | Increase | % Change |
|------|-------|-----------|-----------|----------|----------|
| 🥇 | W.P. Labuan | 3.29 | 5.36 | +2.07 | **+62.9%** |
| 🥈 | W.P. Kuala Lumpur | 4.17 | 6.75 | +2.58 | **+61.9%** |
| 🥉 | Selangor | 4.32 | 6.57 | +2.25 | **+52.1%** |
| 4 | Pulau Pinang | 5.98 | 7.88 | +1.90 | **+31.8%** |
| 5 | Melaka | 5.63 | 7.28 | +1.65 | **+29.3%** |

> **Insight**: Federal Territories and Selangor experienced the most dramatic spikes, with **Labuan, KL, and Selangor** seeing **50-63% increases** in a single year.

---

## 📉 **Biggest 2021-2022 Declines (Top 5)**

| Rank | State | 2021 Rate | 2022 Rate | Decrease | % Change |
|------|-------|-----------|-----------|----------|----------|
| 🥇 | W.P. Kuala Lumpur | 6.75 | 5.05 | -1.70 | **-25.2%** |
| 🥈 | W.P. Labuan | 5.36 | 4.04 | -1.32 | **-24.6%** |
| 🥉 | Selangor | 6.57 | 5.65 | -0.92 | **-14.0%** |
| 4 | Kelantan | 7.50 | 7.30 | -0.20 | **-2.7%** |
| 5 | Pulau Pinang | 7.88 | 7.32 | -0.56 | **-7.1%** |

> **Insight**: The same states that spiked highest in 2021 also showed the **sharpest declines** in 2022, indicating a return toward normal.

---

## 📉 **Biggest 2022-2023 Declines (Top 5)**

| Rank | State | 2022 Rate | 2023 Rate | Decrease | % Change |
|------|-------|-----------|-----------|----------|----------|
| 🥇 | Kelantan | 7.30 | 6.27 | -1.03 | **-14.1%** |
| 🥈 | Perlis | 8.36 | 7.41 | -0.95 | **-11.4%** |
| 🥉 | Terengganu | 7.42 | 6.59 | -0.83 | **-11.2%** |
| 4 | Melaka | 7.03 | 6.35 | -0.68 | **-9.7%** |
| 5 | Perak | 9.40 | 8.57 | -0.83 | **-8.8%** |

> **Insight**: Kelantan shows the strongest continued improvement with a **14.1% decline** in 2023.

---

## 🏆 **States with LATE Peaks (2022)**

| State | 2020 | 2021 | 2022 | 2023 | Peak Year |
|-------|------|------|------|------|-----------|
| Pahang | 5.87 | 6.96 | **7.39** | 6.83 | 2022 |
| Perak | 7.43 | 9.13 | **9.40** | 8.57 | 2022 |
| Perlis | 6.85 | 7.77 | **8.36** | 7.41 | 2022 |
| Terengganu | 6.03 | 7.36 | **7.42** | 6.59 | 2022 |

> **Finding**: 4 states peaked in **2022** rather than 2021, suggesting delayed mortality patterns.

---

## 📊 **2023 Recovery Status**

### States Returned to Near 2020 Levels ✅
| State | 2020 Rate | 2023 Rate | Gap |
|-------|-----------|-----------|-----|
| W.P. Labuan | 3.29 | 3.35 | +0.06 |
| Kelantan | 6.08 | 6.27 | +0.19 |
| Sabah | 5.11 | 5.54 | +0.43 |
| W.P. Kuala Lumpur | 4.17 | 4.78 | +0.61 |

### States Still Elevated ⚠️
| State | 2020 Rate | 2023 Rate | Gap | % Above |
|-------|-----------|-----------|-----|---------|
| Kedah | 7.02 | 8.22 | +1.20 | +17.1% |
| Negeri Sembilan | 7.17 | 8.04 | +0.87 | +12.1% |
| Perak | 7.43 | 8.57 | +1.14 | +15.3% |
| Sarawak | 8.41 | 8.21 | -0.20 | **Actually below** |

> **Insight**: Sarawak is the **only state** with a 2023 rate **below its 2020 baseline** (-0.20).

---

## 💡 Key Insights by State

### 🔴 **High-Rate States (>8.0 in 2023)**
| State | 2023 Rate | Trend | Concern Level |
|-------|-----------|-------|---------------|
| Perak | 8.57 | 🔻 Declining but high | 🔴 **High** |
| Kedah | 8.22 | 🔻 Declining but high | 🔴 **High** |
| Sarawak | 8.21 | 🔻 Declining | 🟠 Moderate |
| Negeri Sembilan | 8.04 | 🔻 Declining | 🟠 Moderate |

### 🟢 **Low-Rate States (<5.5 in 2023)**
| State | 2023 Rate | Trend | Performance |
|-------|-----------|-------|-------------|
| W.P. Putrajaya | 2.40 | 🔺 Slight increase | 🟢 **Excellent** |
| W.P. Labuan | 3.35 | 🔻 Declining | 🟢 Excellent |
| W.P. Kuala Lumpur | 4.78 | 🔻 Declining | 🟢 Good |
| Selangor | 5.38 | 🔻 Declining | 🟢 Good |
| Sabah | 5.54 | 🔻 Declining | 🟢 Good |

---

## 📈 Notable Trends

### **Selangor's Extreme Pattern**
| Year | Rate | Change |
|------|------|--------|
| 2020 | 4.32 | Baseline |
| 2021 | 6.57 | **+52.1%** (biggest spike) |
| 2022 | 5.65 | **-14.0%** (biggest drop) |
| 2023 | 5.38 | -4.8% |

> **Insight**: Selangor shows the most **volatile pattern** among large states.

### **Putrajaya's Stability**
| Year | Rate | Change |
|------|------|--------|
| 2020 | 1.93 | Baseline |
| 2021 | 2.32 | +20.2% |
| 2022 | 2.17 | -6.5% |
| 2023 | 2.40 | +10.6% |

> **Insight**: Putrajaya maintains remarkable stability with rates consistently **below 2.5** — the lowest in the nation.

### **Sarawak's Unique Position**
| Year | Rate | Status |
|------|------|--------|
| 2020 | 8.41 | High baseline |
| 2021 | 9.22 | Peak |
| 2022 | 8.54 | Declining |
| 2023 | 8.21 | **Below 2020** |

> **Insight**: Sarawak is the **only state** to return below its 2020 baseline.

---

## 📊 State Categorization by Recovery Pattern

| Pattern | States | Description |
|---------|--------|-------------|
| **Sharp Spike, Sharp Drop** | Selangor, KL, Labuan, Pulau Pinang | Extreme 2021 surge followed by rapid decline |
| **Moderate Spike, Gradual Decline** | Johor, Kedah, Melaka, Negeri Sembilan | Clear 2021 peak, steady improvement |
| **Late Peak (2022)** | Pahang, Perak, Perlis, Terengganu | Peak in 2022, now declining |
| **Stable/Low Volatility** | Sabah, Sarawak, Putrajaya | Minimal fluctuation, consistent performance |

---

# 8.  Male vs Female death rates by state?
<img width="387" height="370" alt="Screenshot 2026-03-05 104908" src="https://github.com/user-attachments/assets/aee2161c-7c15-46ff-addb-7cfd64f58d01" />

## 👥 Gender Gap Analysis: Male vs Female Death Rates by State

### Summary Statistics by State

| State | Male Rate | Female Rate | Gender Gap | Gap Ranking |
|-------|-----------|-------------|------------|-------------|
| Sarawak | 9.44 | 7.77 | **1.67** | 🥇 Largest Gap |
| Perlis | 8.40 | 6.79 | **1.61** | 🥈 2nd Largest |
| Pulau Pinang | 7.76 | 6.25 | **1.51** | 🥉 3rd Largest |
| Kelantan | 7.54 | 6.06 | **1.48** | 4th |
| Pahang | 7.49 | 6.03 | **1.46** | 5th (tie) |
| Sabah | 6.43 | 4.97 | **1.46** | 5th (tie) |
| Perak | 9.37 | 7.94 | **1.43** | 7th |
| Negeri Sembilan | 8.95 | 7.61 | **1.34** | 8th |
| Kedah | 8.93 | 7.67 | **1.26** | 9th |
| Johor | 7.64 | 6.40 | **1.24** | 10th (tie) |
| Selangor | 6.10 | 4.86 | **1.24** | 10th (tie) |
| Terengganu | 7.46 | 6.24 | **1.22** | 12th |
| W.P. Labuan | 4.48 | 3.54 | **0.94** | 13th |
| W.P. Kuala Lumpur | 5.63 | 4.75 | **0.88** | 14th |
| W.P. Putrajaya | 2.54 | 1.87 | **0.67** | 15th |
| Melaka | 6.90 | 6.25 | **0.65** | 🟢 Smallest Gap |

---

## 🔍 Key Findings

### 📊 **National Overview**

| Metric | Value |
|--------|-------|
| **Average Male Rate (all states)** | 7.24 |
| **Average Female Rate (all states)** | 6.03 |
| **Average Gender Gap** | **1.21** |
| **Largest Gap** | Sarawak (1.67) |
| **Smallest Gap** | Melaka (0.65) |
| **Range of Gaps** | 0.65 to 1.67 |

> **Finding**: Males have **higher death rates than females in all 16 states**, with an average national gap of **1.21 points**.

---

## 🏆 **Top 5 States with LARGEST Gender Gaps**

| Rank | State | Male Rate | Female Rate | Gap | Male Advantage* |
|------|-------|-----------|-------------|-----|-----------------|
| 🥇 | Sarawak | 9.44 | 7.77 | **1.67** | Males **21.5%** higher |
| 🥈 | Perlis | 8.40 | 6.79 | **1.61** | Males **23.7%** higher |
| 🥉 | Pulau Pinang | 7.76 | 6.25 | **1.51** | Males **24.2%** higher |
| 4 | Kelantan | 7.54 | 6.06 | **1.48** | Males **24.4%** higher |
| 5 | Pahang | 7.49 | 6.03 | **1.46** | Males **24.2%** higher |

*\*Percentage calculation: (Gap ÷ Female Rate) × 100*

> **Insight**: In top gap states, male death rates are **21-24% higher** than female rates.

---

## 🟢 **Bottom 5 States with SMALLEST Gender Gaps**

| Rank | State | Male Rate | Female Rate | Gap | Male Advantage* |
|------|-------|-----------|-------------|-----|-----------------|
| 16 | Melaka | 6.90 | 6.25 | **0.65** | Males **10.4%** higher |
| 15 | W.P. Putrajaya | 2.54 | 1.87 | **0.67** | Males **35.8%** higher |
| 14 | W.P. Kuala Lumpur | 5.63 | 4.75 | **0.88** | Males **18.5%** higher |
| 13 | W.P. Labuan | 4.48 | 3.54 | **0.94** | Males **26.6%** higher |
| 12 | Terengganu | 7.46 | 6.24 | **1.22** | Males **19.6%** higher |

*\*Note: Putrajaya's small gap of 0.67 represents a **35.8%** higher male rate due to very low baseline*

> **Insight**: Melaka has the **smallest absolute gap** (0.65), while Federal Territories show gaps under 1.0.

---

## 📈 **Highest Male Death Rates**

| Rank | State | Male Rate | Risk Level |
|------|-------|-----------|------------|
| 🥇 | Sarawak | 9.44 | 🔴 **Highest** |
| 🥈 | Perak | 9.37 | 🔴 Critical |
| 🥉 | Negeri Sembilan | 8.95 | 🟠 High |
| 4 | Kedah | 8.93 | 🟠 High |
| 5 | Perlis | 8.40 | 🟠 High |

> **Finding**: Sarawak (9.44) and Perak (9.37) have the **highest male death rates** in Malaysia — nearly **4x higher** than Putrajaya's male rate (2.54).

---

## 📉 **Lowest Male Death Rates**

| Rank | State | Male Rate | Performance |
|------|-------|-----------|-------------|
| 🥇 | W.P. Putrajaya | 2.54 | 🟢 **Excellent** |
| 🥈 | W.P. Labuan | 4.48 | 🟢 Very Good |
| 🥉 | W.P. Kuala Lumpur | 5.63 | 🟢 Good |
| 4 | Selangor | 6.10 | 🟢 Good |
| 5 | Sabah | 6.43 | 🟢 Moderate |

> **Insight**: Federal Territories dominate the lowest male death rates, with Putrajaya's male rate **(2.54)** being exceptionally low.

---

## 📊 **Highest Female Death Rates**

| Rank | State | Female Rate | Risk Level |
|------|-------|-------------|------------|
| 🥇 | Perak | 7.94 | 🔴 **Highest** |
| 🥈 | Sarawak | 7.77 | 🔴 Critical |
| 🥉 | Kedah | 7.67 | 🟠 High |
| 4 | Negeri Sembilan | 7.61 | 🟠 High |
| 5 | Perlis | 6.79 | 🟠 Moderate |

> **Finding**: Perak (7.94) has the **highest female death rate**, followed closely by Sarawak (7.77).

---

## 📉 **Lowest Female Death Rates**

| Rank | State | Female Rate | Performance |
|------|-------|-------------|-------------|
| 🥇 | W.P. Putrajaya | 1.87 | 🟢 **Excellent** |
| 🥈 | W.P. Labuan | 3.54 | 🟢 Very Good |
| 🥉 | W.P. Kuala Lumpur | 4.75 | 🟢 Good |
| 4 | Selangor | 4.86 | 🟢 Good |
| 5 | Sabah | 4.97 | 🟢 Good |

> **Insight**: Putrajaya's female death rate **(1.87)** is exceptionally low — less than **one-quarter** of Perak's female rate.

---

## 💡 Key Insights

### 1. **Universal Male Disadvantage**
> **Finding**: In **every single state**, male death rates exceed female death rates.

**Implication**: Male mortality is a **nationwide public health concern** requiring targeted interventions.

### 2. **The Sarawak-Perak Male Crisis**
| State | Male Rate | vs National Male Avg | Excess |
|-------|-----------|---------------------|--------|
| Sarawak | 9.44 | +2.20 | **30% above avg** |
| Perak | 9.37 | +2.13 | **29% above avg** |

> **Insight**: Sarawak and Perak men face the **highest mortality burden** in the country.

### 3. **Federal Territory Advantage**
| Territory | Male Rate | Female Rate | Gap | Overall Rank |
|-----------|-----------|-------------|-----|--------------|
| Putrajaya | 2.54 | 1.87 | 0.67 | Lowest overall |
| Labuan | 4.48 | 3.54 | 0.94 | 2nd lowest |
| KL | 5.63 | 4.75 | 0.88 | 3rd lowest |

> **Finding**: All three Federal Territories rank in the **bottom 3** for both male and female death rates.

### 4. **Melaka's Gender Equality Anomaly**
> **Finding**: Melaka has the **smallest gender gap** (0.65) despite moderate rates (Male: 6.90, Female: 6.25).

**Implication**: Melaka may have more **gender-equal healthcare access** or lifestyle factors.

### 5. **Percentage Gap vs Absolute Gap**
| State | Absolute Gap | % Higher | Interpretation |
|-------|--------------|----------|----------------|
| Putrajaya | 0.67 | **35.8%** | Small absolute gap but large relative difference |
| Sarawak | 1.67 | **21.5%** | Large absolute gap, moderate relative |
| Kelantan | 1.48 | **24.4%** | Large both absolute and relative |

> **Insight**: Putrajaya's small absolute gap (0.67) represents a **35.8%** male disadvantage — the **highest percentage gap** in the nation.

---

# 9.  Highest districts Rank by death rate within each state?
<img width="428" height="556" alt="Screenshot 2026-03-05 105229" src="https://github.com/user-attachments/assets/306cef14-c283-4080-ba7d-9bf7344f7e0e" />

## 📍 District-Level Death Rate Rankings Within States

### Overview
This analysis ranks districts within each Malaysian state by average death rate, identifying high-risk areas and performance disparities at the local level.

---

## 🔴 **States with Extreme District Disparities**

### 1. **Sarawak** — *Most Volatile*
| Rank | District | Avg Rate | Total Deaths | Risk Level |
|------|----------|-----------|--------------|------------|
| 🥇 1 | Song | **15.37** | 617 | 🔴 **EXTREME** |
| 🥈 2 | Kanowit | **13.66** | 1,349 | 🔴 Extreme |
| 🥉 3 | Marudi | **13.22** | 1,006 | 🔴 Extreme |
| ... | ... | ... | ... | ... |
| 39 | Bintulu | 3.12 | 2,274 | 🟢 Low |
| 40 | Samarahan | **2.49** | 1,309 | 🟢 **Lowest** |

| Metric | Value |
|--------|-------|
| **Highest Rate** | Song (15.37) |
| **Lowest Rate** | Samarahan (2.49) |
| **Range** | **12.88 points** |
| **Ratio (High:Low)** | **6.2:1** |

> **Finding**: Sarawak shows the **most extreme disparity** of any state — Song's death rate (15.37) is **6.2 times higher** than Samarahan's (2.49).

### 2. **Sabah** — *Wide Urban-Rural Divide*
| Rank | District | Avg Rate | Total Deaths | Type |
|------|----------|-----------|--------------|------|
| 🥇 1 | Kuala Penyu | **10.76** | 1,029 | 🔴 Rural Crisis |
| 🥈 2 | Pitas | **9.55** | 1,429 | 🔴 Rural Crisis |
| 🥉 3 | Beaufort | **8.66** | 2,658 | 🔴 High Risk |
| ... | ... | ... | ... | ... |
| 26 | Kalabakan | 2.27 | 347 | 🟢 Low |
| 27 | Kinabatangan | **1.66** | 946 | 🟢 **Lowest** |

| Metric | Value |
|--------|-------|
| **Highest Rate** | Kuala Penyu (10.76) |
| **Lowest Rate** | Kinabatangan (1.66) |
| **Range** | **9.10 points** |
| **Ratio (High:Low)** | **6.5:1** |

> **Finding**: Sabah's rural districts (Kuala Penyu, Pitas) face crisis-level rates while Kinabatangan achieves the **lowest district rate in Malaysia** (1.66).

### 3. **Perak** — *Northern Disparity*
| Rank | District | Avg Rate | Total Deaths | Location |
|------|----------|-----------|--------------|----------|
| 🥇 1 | Selama | **12.71** | 1,318 | 🔴 North |
| 🥈 2 | Larut Dan Matang | **9.97** | 10,903 | 🔴 North |
| 🥉 3 | Kerian | **9.79** | 6,579 | 🔴 North |
| ... | ... | ... | ... | ... |
| 13 | Muallim | **5.31** | 1,639 | 🟢 South |

| Metric | Value |
|--------|-------|
| **Highest Rate** | Selama (12.71) |
| **Lowest Rate** | Muallim (5.31) |
| **Range** | **7.40 points** |

> **Finding**: Perak's **northern districts** (Selama, Larut, Kerian) dominate the top ranks, while southern areas show better outcomes.

---

## 🏆 **Highest Risk Districts in Malaysia (Top 10)**

| Rank | State | District | Avg Rate | Deaths | Risk Level |
|------|-------|----------|-----------|--------|------------|
| 🥇 1 | Sarawak | Song | **15.37** | 617 | 🔴 **EXTREME** |
| 🥈 2 | Sarawak | Kanowit | **13.66** | 1,349 | 🔴 Extreme |
| 🥉 3 | Sarawak | Marudi | **13.22** | 1,006 | 🔴 Extreme |
| 4 | Perak | Selama | **12.71** | 1,318 | 🔴 Extreme |
| 5 | Sarawak | Bukit Mabong | **12.55** | 382 | 🔴 Extreme |
| 6 | Sarawak | Maradong | **12.01** | 982 | 🔴 Extreme |
| 7 | Sarawak | Saratok | **11.90** | 1,102 | 🔴 Extreme |
| 8 | Sarawak | Betong | **11.39** | 1,666 | 🔴 Extreme |
| 9 | Sarawak | Kabong | **10.99** | 616 | 🔴 Extreme |
| 10 | Sarawak | Lubok Antu | **10.54** | 1,039 | 🔴 Extreme |

> **Finding**: **9 of top 10** highest-risk districts are in **Sarawak**, with Song (15.37) as the most critical district in Malaysia.

---

## 🟢 **Lowest Risk Districts in Malaysia (Top 10)**

| Rank | State | District | Avg Rate | Deaths | Performance |
|------|-------|----------|-----------|--------|-------------|
| 🥇 1 | Sabah | Kinabatangan | **1.66** | 946 | 🟢 **EXCELLENT** |
| 🥈 2 | Sabah | Kalabakan | **2.27** | 347 | 🟢 Excellent |
| 🥉 3 | Sarawak | Samarahan | **2.49** | 1,309 | 🟢 Excellent |
| 4 | Sabah | Tongod | **3.15** | 547 | 🟢 Very Good |
| 5 | Sarawak | Bintulu | **3.12** | 2,274 | 🟢 Very Good |
| 6 | Sabah | Kunak | **3.47** | 972 | 🟢 Very Good |
| 7 | Sabah | Lahad Datu | **3.45** | 3,238 | 🟢 Very Good |
| 8 | Selangor | Sepang | **3.57** | 4,783 | 🟢 Very Good |
| 9 | Sabah | Telupid | **3.72** | 339 | 🟢 Good |
| 10 | Sabah | Kota Kinabalu | **3.91** | 7,938 | 🟢 Good |

> **Finding**: **Sabah dominates** the lowest-risk list with 7 districts in top 10, led by Kinabatangan (1.66) — the **safest district in Malaysia**.

---

# 10.  Statistics for each district?
<img width="757" height="556" alt="Screenshot 2026-03-05 105615" src="https://github.com/user-attachments/assets/76620f8e-551d-4c1d-b019-2a82e5114c98" />

## 📊 District-Level Statistical Analysis: Volatility & Mortality Patterns

### Overview
This analysis examines death rate statistics across Malaysian districts, focusing on volatility (standard deviation), ranges, and average monthly deaths to identify patterns and outliers.

---

## 🔴 **Most Volatile Districts (Highest Standard Deviation)**

### Top 10 Most Volatile Districts
| Rank | District | State | Std Dev | Mean Rate | Min | Max | Range | Volatility Level |
|------|----------|-------|---------|-----------|-----|-----|-------|------------------|
| 🥇 1 | Marudi | Sarawak | **6.34** | 13.22 | 8.31 | 27.82 | 19.51 | 🔴 **EXTREME** |
| 🥈 2 | Saratok | Sarawak | **3.25** | 11.90 | 8.32 | 19.04 | 10.72 | 🔴 Extreme |
| 🥉 3 | Song | Sarawak | **3.22** | 15.37 | 11.92 | 22.45 | 10.53 | 🔴 Extreme |
| 4 | Kanowit | Sarawak | 2.68 | 13.66 | 10.08 | 17.97 | 7.89 | 🟠 High |
| 5 | Bukit Mabong | Sarawak | 2.49 | 12.55 | 7.62 | 15.12 | 7.50 | 🟠 High |
| 6 | Kuala Penyu | Sabah | 2.45 | 10.76 | 6.69 | 14.26 | 7.57 | 🟠 High |
| 7 | Pusa | Sarawak | 2.39 | 9.19 | 6.29 | 13.79 | 7.50 | 🟠 High |
| 8 | Pakan | Sarawak | 2.20 | 9.50 | 6.44 | 13.17 | 6.73 | 🟡 Moderate |
| 9 | Julau | Sarawak | 2.19 | 10.11 | 6.36 | 14.34 | 7.98 | 🟡 Moderate |
| 10 | Lubok Antu | Sarawak | 2.15 | 10.54 | 8.18 | 13.68 | 5.50 | 🟡 Moderate |

> **Finding**: **9 of top 10** most volatile districts are in **Sarawak**, with Marudi (6.34) showing extreme volatility — rates ranging from 8.31 to 27.82.

---

## 🟢 **Most Stable Districts (Lowest Standard Deviation)**

### Top 10 Most Stable Districts
| Rank | District | State | Std Dev | Mean Rate | Min | Max | Range | Stability Level |
|------|----------|-------|---------|-----------|-----|-----|-------|-----------------|
| 🥇 1 | W.P. Putrajaya | Putrajaya | **0.39** | 2.20 | 1.65 | 2.82 | 1.17 | 🟢 **EXCELLENT** |
| 🥈 2 | Kinabatangan | Sabah | **0.40** | 1.66 | 1.06 | 2.30 | 1.24 | 🟢 Excellent |
| 🥉 3 | Beluran | Sabah | **0.42** | 4.23 | 3.83 | 5.13 | 1.30 | 🟢 Excellent |
| 4 | Sebauh | Sarawak | 0.47 | 6.32 | 5.82 | 7.26 | 1.44 | 🟢 Excellent |
| 5 | Yan | Kedah | 0.48 | 7.38 | 6.69 | 8.18 | 1.49 | 🟢 Excellent |
| 6 | Kalabakan | Sabah | 0.49 | 2.27 | 1.24 | 2.66 | 1.42 | 🟢 Excellent |
| 7 | Subis | Sarawak | 0.50 | 7.79 | 7.09 | 8.51 | 1.42 | 🟢 Excellent |
| 8 | Tatau | Sarawak | 0.53 | 5.41 | 4.91 | 6.48 | 1.57 | 🟢 Very Good |
| 9 | Samarahan | Sarawak | 0.54 | 2.49 | 1.74 | 3.41 | 1.67 | 🟢 Very Good |
| 10 | Bintulu | Sarawak | 0.57 | 3.12 | 2.44 | 3.96 | 1.52 | 🟢 Very Good |

> **Finding**: Putrajaya (0.39) and Kinabatangan (0.40) are the **most stable districts** in Malaysia, with remarkably consistent death rates.

---

## 📈 **Extreme Rate Ranges (Highest Min-Max Spread)**

### Top 10 Widest Rate Ranges
| Rank | District | State | Min | Max | Range | Mean | Volatility |
|------|----------|-------|-----|-----|-------|------|------------|
| 🥇 1 | Marudi | Sarawak | 8.31 | 27.82 | **19.51** | 13.22 | 6.34 |
| 🥈 2 | Saratok | Sarawak | 8.32 | 19.04 | **10.72** | 11.90 | 3.25 |
| 🥉 3 | Song | Sarawak | 11.92 | 22.45 | **10.53** | 15.37 | 3.22 |
| 4 | Julau | Sarawak | 6.36 | 14.34 | **7.98** | 10.11 | 2.19 |
| 5 | Kanowit | Sarawak | 10.08 | 17.97 | **7.89** | 13.66 | 2.68 |
| 6 | Kuala Penyu | Sabah | 6.69 | 14.26 | **7.57** | 10.76 | 2.45 |
| 7 | Bukit Mabong | Sarawak | 7.62 | 15.12 | **7.50** | 12.55 | 2.49 |
| 8 | Pusa | Sarawak | 6.29 | 13.79 | **7.50** | 9.19 | 2.39 |
| 9 | Pakan | Sarawak | 6.44 | 13.17 | **6.73** | 9.50 | 2.20 |
| 10 | Lubok Antu | Sarawak | 8.18 | 13.68 | **5.50** | 10.54 | 2.15 |

> **Finding**: Marudi's range of **19.51 points** (8.31 to 27.82) is the most extreme in Malaysia — nearly double the next highest.

---

## 📊 **Highest Mean Death Rates**

### Top 10 Highest Average Rates
| Rank | District | State | Mean Rate | Volatility | Risk Level |
|------|----------|-------|-----------|------------|------------|
| 🥇 1 | Song | Sarawak | **15.37** | 3.22 | 🔴 **EXTREME** |
| 🥈 2 | Kanowit | Sarawak | **13.66** | 2.68 | 🔴 Extreme |
| 🥉 3 | Marudi | Sarawak | **13.22** | 6.34 | 🔴 Extreme |
| 4 | Selama | Perak | **12.71** | 1.09 | 🔴 Extreme |
| 5 | Bukit Mabong | Sarawak | **12.55** | 2.49 | 🔴 Extreme |
| 6 | Maradong | Sarawak | **12.01** | 1.78 | 🔴 Extreme |
| 7 | Saratok | Sarawak | **11.90** | 3.25 | 🔴 Extreme |
| 8 | Betong | Sarawak | **11.39** | 1.90 | 🔴 Extreme |
| 9 | Kabong | Sarawak | **10.99** | 1.63 | 🔴 Extreme |
| 10 | Kuala Penyu | Sabah | **10.76** | 2.45 | 🔴 Extreme |

> **Finding**: **9 of top 10** highest mean rates are in Sarawak, with Song (15.37) as the most critical district.

---

## 🟢 **Lowest Mean Death Rates**

### Top 10 Lowest Average Rates
| Rank | District | State | Mean Rate | Volatility | Performance |
|------|----------|-------|-----------|------------|-------------|
| 🥇 1 | Kinabatangan | Sabah | **1.66** | 0.40 | 🟢 **EXCELLENT** |
| 🥈 2 | W.P. Putrajaya | Putrajaya | **2.20** | 0.39 | 🟢 Excellent |
| 🥉 3 | Kalabakan | Sabah | **2.27** | 0.49 | 🟢 Excellent |
| 4 | Samarahan | Sarawak | **2.49** | 0.54 | 🟢 Excellent |
| 5 | Bintulu | Sarawak | **3.12** | 0.57 | 🟢 Excellent |
| 6 | Tongod | Sabah | **3.15** | 0.70 | 🟢 Excellent |
| 7 | Sepang | Selangor | **3.57** | 0.90 | 🟢 Very Good |
| 8 | Telupid | Sabah | **3.72** | 1.36 | 🟢 Very Good |
| 9 | Petaling | Selangor | **3.93** | 0.75 | 🟢 Very Good |
| 10 | W.P. Labuan | Labuan | **4.01** | 0.97 | 🟢 Very Good |

> **Finding**: Kinabatangan (1.66) remains Malaysia's **safest district**, with rates consistently below 2.30.

---

## 📊 **Highest Monthly Death Volume**

### Top 10 Highest Average Monthly Deaths
| Rank | District | State | Avg Monthly Deaths | Total Deaths | Mean Rate |
|------|----------|-------|-------------------|--------------|-----------|
| 🥇 1 | W.P. Kuala Lumpur | KL | **5,157.5** | 41,260 | 5.19 |
| 🥈 2 | Petaling | Selangor | **4,571.1** | 36,569 | 3.93 |
| 🥉 3 | Johor Bahru | Johor | **4,052.9** | 32,423 | 4.66 |
| 4 | Kinta | Perak | **3,196.4** | 25,571 | 7.10 |
| 5 | Ulu Langat | Selangor | **3,368.1** | 26,945 | 4.73 |
| 6 | Klang | Selangor | **2,927.9** | 23,423 | 5.30 |
| 7 | Gombak | Selangor | **2,194.8** | 17,558 | 4.59 |
| 8 | Timur Laut | Pulau Pinang | **2,236.3** | 17,890 | 8.04 |
| 9 | Seremban | Negeri Sembilan | **1,950.8** | 15,606 | 5.57 |
| 10 | Kota Bharu | Kelantan | **1,888.5** | 15,108 | 6.68 |

> **Finding**: KL (5,157 monthly deaths) and Petaling (4,571) handle the **highest death volumes** while maintaining low-to-moderate rates.

---

## 🔬 **Volatility vs Rate Analysis**

### High Rate + High Volatility (Most Unpredictable & Dangerous)
| District | State | Mean Rate | Std Dev | Risk Profile |
|----------|-------|-----------|---------|--------------|
| Marudi | Sarawak | 13.22 | 6.34 | 🔴 **Critical** |
| Song | Sarawak | 15.37 | 3.22 | 🔴 Critical |
| Saratok | Sarawak | 11.90 | 3.25 | 🔴 Critical |
| Kanowit | Sarawak | 13.66 | 2.68 | 🔴 Critical |

### High Rate + Low Volatility (Consistently Dangerous)
| District | State | Mean Rate | Std Dev | Risk Profile |
|----------|-------|-----------|---------|--------------|
| Selama | Perak | 12.71 | 1.09 | 🔴 **Stable Crisis** |
| Betong | Sarawak | 11.39 | 1.90 | 🔴 Stable Crisis |
| Maradong | Sarawak | 12.01 | 1.78 | 🔴 Stable Crisis |

### Low Rate + Low Volatility (Consistently Safe) — **BEST PRACTICE**
| District | State | Mean Rate | Std Dev | Performance |
|----------|-------|-----------|---------|-------------|
| Kinabatangan | Sabah | 1.66 | 0.40 | 🟢 **Gold Standard** |
| Putrajaya | Putrajaya | 2.20 | 0.39 | 🟢 Gold Standard |
| Kalabakan | Sabah | 2.27 | 0.49 | 🟢 Excellent |
| Samarahan | Sarawak | 2.49 | 0.54 | 🟢 Excellent |

## 💡 Key Insights

### 1. **Sarawak's Volatility Crisis**
> **Finding**: Sarawak dominates volatility rankings with **9 of top 10** most volatile districts and **9 of top 10** highest mean rates.

**Implication**: Sarawak requires **district-specific interventions** rather than state-wide approaches.

### 2. **The Marudi Anomaly**
| Metric | Value | Significance |
|--------|-------|--------------|
| Std Dev | 6.34 | **2x higher** than 2nd place |
| Range | 8.31 to 27.82 | Extreme fluctuation |
| Mean | 13.22 | High baseline |

> **Insight**: Marudi is Malaysia's most **unpredictable district** — rates swing wildly, suggesting sporadic mortality events or data issues.

### 3. **Stability Champions**
| District | Std Dev | Mean | Why It Matters |
|----------|---------|------|----------------|
| Putrajaya | 0.39 | 2.20 | Federal administration, consistent healthcare |
| Kinabatangan | 0.40 | 1.66 | Rural success story |
| Kalabakan | 0.49 | 2.27 | New district? Stable outcomes |

> **Insight**: These districts prove that **stability and low rates are achievable** even in different contexts.

### 4. **Volume vs Volatility**
| District | Monthly Deaths | Std Dev | Rate | Profile |
|----------|----------------|---------|------|---------|
| Petaling | 4,571 | 0.75 | 3.93 | **High volume, low volatility** ✅ |
| KL | 5,157 | 1.06 | 5.19 | **High volume, moderate volatility** |
| Marudi | 126 | 6.34 | 13.22 | **Low volume, extreme volatility** ❌ |

> **Finding**: High death volume doesn't necessarily mean high volatility — Petaling proves stable systems can handle large caseloads.

### 5. **The Selama Exception**
> **Finding**: Selama (Perak) has a **high mean rate (12.71)** but **low volatility (1.09)** — consistently dangerous.

**Implication**: Selama needs **systemic intervention**, not just crisis response.

---

# 11.  Districts with MOST variation in death rates?
<img width="427" height="452" alt="Screenshot 2026-03-05 105959" src="https://github.com/user-attachments/assets/a49c8376-c9d9-4239-80af-9e375b76eaf6" />

## 📊 Districts with MOST Variation in Death Rates (Highest Volatility)

### Overview
This analysis identifies districts with the highest volatility in death rates, measured by standard deviation and range spread. High volatility indicates unpredictable mortality patterns that may require special investigation.

---

## 🔴 **Top 20 Most Volatile Districts in Malaysia**

| Rank | District | State | Avg Rate | Volatility (Std Dev) | Range Spread | Risk Profile |
|------|----------|-------|----------|----------------------|--------------|--------------|
| 🥇 **1** | **Marudi** | Sarawak | 13.22 | **6.34** | 19.51 | 🔴 **EXTREME** |
| 🥈 **2** | **Saratok** | Sarawak | 11.90 | **3.25** | 10.72 | 🔴 Extreme |
| 🥉 **3** | **Song** | Sarawak | 15.37 | **3.22** | 10.53 | 🔴 Extreme |
| 4 | **Kanowit** | Sarawak | 13.66 | **2.68** | 7.89 | 🔴 High |
| 5 | **Bukit Mabong** | Sarawak | 12.55 | **2.49** | 7.50 | 🔴 High |
| 6 | **Kuala Penyu** | Sabah | 10.76 | **2.45** | 7.57 | 🔴 High |
| 7 | **Pusa** | Sarawak | 9.19 | **2.39** | 7.50 | 🔴 High |
| 8 | **Pakan** | Sarawak | 9.50 | **2.20** | 6.73 | 🟠 Elevated |
| 9 | **Julau** | Sarawak | 10.11 | **2.19** | 7.98 | 🟠 Elevated |
| 10 | **Lubok Antu** | Sarawak | 10.54 | **2.15** | 5.50 | 🟠 Elevated |
| 11 | **Selangau** | Sarawak | 7.62 | **2.00** | 5.85 | 🟠 Moderate |
| 12 | **Betong** | Sarawak | 11.39 | **1.90** | 5.76 | 🟡 Moderate |
| 13 | **Maradong** | Sarawak | 12.01 | **1.78** | 5.73 | 🟡 Moderate |
| 14 | **Tenom** | Sabah | 7.87 | **1.67** | 5.71 | 🟡 Moderate |
| 15 | **Matu** | Sarawak | 9.13 | **1.65** | 6.32 | 🟡 Moderate |
| 16 | **Kabong** | Sarawak | 10.99 | **1.63** | 4.74 | 🟢 Lower |
| 17 | **Telang Usan** | Sarawak | 7.48 | **1.60** | 4.14 | 🟢 Lower |
| 18 | **Kudat** | Sabah | 7.05 | **1.58** | 4.88 | 🟢 Lower |
| 19 | **Daro** | Sarawak | 9.10 | **1.57** | 4.25 | 🟢 Lower |
| 20 | **Kapit** | Sarawak | 8.64 | **1.56** | 4.68 | 🟢 Lower |

---

## 🔍 Key Findings

### 🏆 **The Extreme Outlier: Marudi, Sarawak**

| Metric | Value | Comparison |
|--------|-------|------------|
| **Volatility (Std Dev)** | **6.34** | 2x higher than 2nd place |
| **Average Rate** | 13.22 | 3rd highest in Malaysia |
| **Range Spread** | **19.51** | 8.31 to 27.82 |
| **Rank** | 🥇 **#1 Most Volatile** | Nationwide |

> **Finding**: Marudi's volatility (**6.34**) is more than double the next highest district — an **extreme outlier** requiring immediate investigation.

---

### 📊 **Sarawak Dominates Volatility Rankings**

| Statistic | Value |
|-----------|-------|
| **Sarawak Districts in Top 20** | **18 of 20** (90%) |
| **Sabah Districts in Top 20** | 2 of 20 (10%) |
| **Other States** | 0 |

> **Finding**: **Sarawak accounts for 90% of Malaysia's most volatile districts**, indicating a systemic issue in the state's mortality patterns.

---

### 📈 **The Volatility "Elite" (Std Dev > 3.0)**

| Rank | District | State | Std Dev | Avg Rate | Range |
|------|----------|-------|---------|----------|-------|
| 1 | Marudi | Sarawak | **6.34** | 13.22 | 19.51 |
| 2 | Saratok | Sarawak | **3.25** | 11.90 | 10.72 |
| 3 | Song | Sarawak | **3.22** | 15.37 | 10.53 |

> **Insight**: These three districts form Malaysia's **"Volatility Triangle"** — extreme fluctuations requiring urgent study.

---

### 🔴 **High Volatility + High Rate (Most Dangerous Combination)**

| District | State | Std Dev | Avg Rate | Risk Level |
|----------|-------|---------|----------|------------|
| **Marudi** | Sarawak | 6.34 | 13.22 | 🔴 **CRITICAL** |
| **Song** | Sarawak | 3.22 | 15.37 | 🔴 Critical |
| **Kanowit** | Sarawak | 2.68 | 13.66 | 🔴 Critical |
| **Bukit Mabong** | Sarawak | 2.49 | 12.55 | 🔴 Critical |
| **Saratok** | Sarawak | 3.25 | 11.90 | 🔴 Critical |
| **Kuala Penyu** | Sabah | 2.45 | 10.76 | 🔴 Critical |

> **Finding**: These districts face a **double threat** — already high death rates made worse by unpredictable fluctuations.

---

### 📉 **The Range Spread Crisis**

#### Top 5 Widest Ranges
| Rank | District | Min Rate | Max Rate | Range | Implication |
|------|----------|----------|----------|-------|-------------|
| 🥇 | Marudi | 8.31 | 27.82 | **19.51** | Rates can **triple** |
| 🥈 | Saratok | 8.32 | 19.04 | **10.72** | Rates more than double |
| 🥉 | Song | 11.92 | 22.45 | **10.53** | Consistently high + volatile |
| 4 | Julau | 6.36 | 14.34 | **7.98** | Wide swings |
| 5 | Kanowit | 10.08 | 17.97 | **7.89** | Always high, sometimes extreme |

> **Insight**: Marudi's range of **19.51** means death rates can spike from 8.31 to 27.82 — a **3.3x increase** — indicating possible sporadic mortality events.

---

## 💡 Key Insights

### 1. **The Sarawak Phenomenon**
> **Finding**: 18 of 20 most volatile districts are in Sarawak, suggesting **systemic factors**:
- Remote geography with varying healthcare access
- Sporadic disease outbreaks
- Data reporting inconsistencies
- Seasonal migration patterns

### 2. **Volatility ≠ High Rate (Always)**
| District | Avg Rate | Volatility | Pattern |
|----------|----------|------------|---------|
| Song | 15.37 | 3.22 | **High + Volatile** 🔴 |
| Marudi | 13.22 | 6.34 | **High + Extreme Volatility** 🔴 |
| Selangau | 7.62 | 2.00 | **Moderate + Volatile** 🟡 |
| Pusa | 9.19 | 2.39 | **Moderate + Volatile** 🟡 |

> **Insight**: Volatility affects districts across all rate levels — not just high-rate areas.

### 3. **Sabah's Sole Representative**
> **Finding**: Kuala Penyu (Sabah) is the **only non-Sarawak district in top 10**, ranking 6th with 2.45 volatility.

**Implication**: Sabah's volatility issues are more localized, while Sarawak's are widespread.

### 4. **The Marudi Anomaly**
> **Finding**: Marudi's volatility (**6.34**) is:
- **2x** higher than 2nd place Saratok (3.25)
- **4x** higher than the 20th place Kapit (1.56)
- **16x** higher than the least volatile districts

**Implication**: Marudi requires **immediate, dedicated investigation** — this level of variance suggests either extreme health crises or data quality issues.

---

# 12.  Districts with MOST variation in death rates?
<img width="482" height="452" alt="Screenshot 2026-03-05 110213" src="https://github.com/user-attachments/assets/e3f1fe62-8fc7-49f4-a27b-a402179c1368" />

## 📊 Districts with LEAST Variation in Death Rates (Most Stable)

### Overview
This analysis identifies districts with the lowest volatility in death rates, measured by standard deviation and range spread. Low volatility indicates consistent, predictable mortality patterns — often a sign of stable healthcare systems and reliable data reporting.

---

## 🟢 **Top 20 Most Stable Districts in Malaysia**

| Rank | District | State | Avg Rate | Volatility (Std Dev) | Range Spread | Stability Level |
|------|----------|-------|----------|----------------------|--------------|-----------------|
| 🥇 **1** | **W.P. Putrajaya** | Putrajaya | 2.20 | **0.39** | 1.16 | 🟢 **GOLD STANDARD** |
| 🥈 **2** | **Kinabatangan** | Sabah | 1.66 | **0.40** | 1.25 | 🟢 Gold Standard |
| 🥉 **3** | **Beluran** | Sabah | 4.23 | **0.42** | 1.30 | 🟢 Excellent |
| 4 | **Sebauh** | Sarawak | 6.32 | **0.47** | 1.44 | 🟢 Excellent |
| 5 | **Yan** | Kedah | 7.38 | **0.48** | 1.49 | 🟢 Excellent |
| 6 | **Kalabakan** | Sabah | 2.27 | **0.49** | 1.42 | 🟢 Excellent |
| 7 | **Subis** | Sarawak | 7.79 | **0.50** | 1.42 | 🟢 Excellent |
| 8 | **Tatau** | Sarawak | 5.41 | **0.53** | 1.57 | 🟢 Very Good |
| 9 | **Samarahan** | Sarawak | 2.49 | **0.54** | 1.67 | 🟢 Very Good |
| 10 | **Semporna** | Sabah | 4.48 | **0.57** | 1.66 | 🟢 Very Good |
| 11 | **Bintulu** | Sarawak | 3.12 | **0.57** | 1.52 | 🟢 Very Good |
| 12 | **Kunak** | Sabah | 3.47 | **0.59** | 1.81 | 🟢 Very Good |
| 13 | **Lahad Datu** | Sabah | 3.45 | **0.63** | 2.13 | 🟢 Good |
| 14 | **Muar** | Johor | 6.74 | **0.64** | 2.01 | 🟢 Good |
| 15 | **Kota Kinabalu** | Sabah | 3.91 | **0.67** | 2.07 | 🟢 Good |
| 16 | **Lipis** | Pahang | 6.05 | **0.69** | 2.01 | 🟢 Good |
| 17 | **Sandakan** | Sabah | 4.09 | **0.70** | 2.34 | 🟢 Good |
| 18 | **Tongod** | Sabah | 3.15 | **0.70** | 1.90 | 🟢 Good |
| 19 | **Alor Gajah** | Melaka | 6.21 | **0.70** | 2.35 | 🟢 Good |
| 20 | **Batu Pahat** | Johor | 6.83 | **0.71** | 2.48 | 🟢 Good |

---

## 🔍 Key Findings

### 🏆 **The Gold Standard: Putrajaya & Kinabatangan**

| District | State | Std Dev | Avg Rate | Range | Why It's Special |
|----------|-------|---------|----------|-------|------------------|
| **W.P. Putrajaya** | Putrajaya | **0.39** | 2.20 | 1.16 | Federal admin center, consistent healthcare |
| **Kinabatangan** | Sabah | **0.40** | **1.66** | 1.25 | Rural success story — lowest rate + stable |

> **Finding**: Putrajaya and Kinabatangan are Malaysia's **most stable districts**, with volatility below 0.40 — a benchmark for the nation.

---

### 🗺️ **State Representation in Top 20**

| State | Number of Districts | % of Top 20 | Leading District |
|-------|---------------------|-------------|------------------|
| **Sabah** | **8** | 40% | Kinabatangan (0.40) |
| **Sarawak** | **6** | 30% | Sebauh (0.47) |
| **Johor** | 2 | 10% | Muar (0.64) |
| **Kedah** | 1 | 5% | Yan (0.48) |
| **Pahang** | 1 | 5% | Lipis (0.69) |
| **Melaka** | 1 | 5% | Alor Gajah (0.70) |
| **Putrajaya** | 1 | 5% | Putrajaya (0.39) |

> **Finding**: **Sabah leads** with 8 of the top 20 most stable districts, followed by Sarawak with 6 — East Malaysia dominates stability rankings.

---

### 📊 **The Ultra-Stable Elite (Std Dev < 0.50)**

| Rank | District | State | Std Dev | Avg Rate | Range |
|------|----------|-------|---------|----------|-------|
| 🥇 | Putrajaya | Putrajaya | **0.39** | 2.20 | 1.16 |
| 🥈 | Kinabatangan | Sabah | **0.40** | 1.66 | 1.25 |
| 🥉 | Beluran | Sabah | **0.42** | 4.23 | 1.30 |
| 4 | Sebauh | Sarawak | **0.47** | 6.32 | 1.44 |
| 5 | Yan | Kedah | **0.48** | 7.38 | 1.49 |
| 6 | Kalabakan | Sabah | **0.49** | 2.27 | 1.42 |
| 7 | Subis | Sarawak | **0.50** | 7.79 | 1.42 |

> **Insight**: These 7 districts form Malaysia's **"Stability Elite"** — remarkably consistent death rates across diverse geographies and rate levels.

---

### 🟢 **Low Rate + Low Volatility (Best Practice Models)**

| District | State | Avg Rate | Std Dev | Why It's a Model |
|----------|-------|----------|---------|------------------|
| **Kinabatangan** | Sabah | **1.66** | 0.40 | **The ideal** — lowest rate, ultra-stable |
| **Putrajaya** | Putrajaya | **2.20** | 0.39 | Federal efficiency |
| **Kalabakan** | Sabah | **2.27** | 0.49 | New district? Consistent outcomes |
| **Samarahan** | Sarawak | **2.49** | 0.54 | Sarawak's best performer |
| **Bintulu** | Sarawak | **3.12** | 0.57 | Industrial hub with stability |

> **Finding**: These districts prove that **low death rates and stability go hand in hand** — achievable even in different contexts (rural, urban, industrial).

---

### 📈 **Moderate Rate + High Stability**

| District | State | Avg Rate | Std Dev | Range | Significance |
|----------|-------|----------|---------|-------|--------------|
| **Yan** | Kedah | 7.38 | 0.48 | 1.49 | Moderate rate but extremely stable |
| **Subis** | Sarawak | 7.79 | 0.50 | 1.42 | Higher rate but predictable |
| **Sebauh** | Sarawak | 6.32 | 0.47 | 1.44 | Consistent despite moderate rate |
| **Muar** | Johor | 6.74 | 0.64 | 2.01 | Stable urban district |

> **Insight**: Stability isn't just for low-rate districts — Yan and Subis prove that **even areas with moderate rates can achieve remarkable consistency**.

---

## 💡 Key Insights

### 1. **Sabah's Stability Leadership**
> **Finding**: Sabah leads Malaysia with **8 districts in the top 20** most stable list.

**Implication**: Despite perceptions of rural healthcare challenges, Sabah demonstrates that **consistency is achievable** across diverse districts.

### 2. **The Kinabatangan Miracle**
| Metric | Value | National Rank |
|--------|-------|---------------|
| Avg Rate | 1.66 | 🥇 **Lowest** |
| Volatility | 0.40 | 🥈 **2nd Lowest** |
| Range | 1.06 to 2.30 | Narrowest among low-rate districts |

> **Insight**: Kinabatangan is Malaysia's **gold standard** — proving that rural districts can achieve both the lowest rates AND exceptional stability.

### 3. **Putrajaya's Administrative Excellence**
> **Finding**: Putrajaya's volatility (**0.39**) is the **lowest in Malaysia** — rates consistently between 1.65 and 2.82.

**Implication**: Federal administrative centers with concentrated healthcare resources can achieve **near-perfect consistency**.

### 4. **Sarawak's Surprising Stability**
> **Finding**: Despite Sarawak's dominance in high-volatility rankings, it also places **6 districts in the top 20 most stable** list.

**Implication**: Sarawak is a **state of extremes** — containing both Malaysia's most volatile (Marudi) and most stable (Samarahan) districts.

### 5. **The Volatility Spectrum in Sarawak**
| District | Volatility | Category |
|----------|------------|----------|
| Marudi | 6.34 | 🔴 Most Volatile |
| Samarahan | 0.54 | 🟢 9th Most Stable |
| **Gap** | **5.80** | **Extreme range** |

> **Insight**: Sarawak's districts span the **entire volatility spectrum** — from the nation's most unstable to some of its most stable.

---

# 13.  Male-to-Female death ratio by state and year? 
<img width="557" height="558" alt="Screenshot 2026-03-05 110445" src="https://github.com/user-attachments/assets/b684e71b-b567-4603-b638-3d1b4f333239" />

## 👥 Male-to-Female Death Ratio Analysis by State and Year (2020-2023)

### Overview
This analysis examines the ratio of male deaths to female deaths across all districts and states in Malaysia from 2020 to 2023. A ratio >1.00 indicates more male deaths than female deaths.

---

## 📊 National Summary by Year

| Year | Average Ratio | Range (Min-Max) | Trend |
|------|---------------|-----------------|-------|
| 2020 | **1.39** | 0.75 - 2.19 | Baseline |
| 2021 | **1.34** | 0.80 - 2.31 | Slight decrease |
| 2022 | **1.36** | 1.01 - 2.62 | Slight increase |
| 2023 | **1.35** | 1.02 - 3.67 | Stable |

> **Finding**: The national male-to-female death ratio has remained consistently between **1.34 and 1.39** over the 4-year period, indicating **males consistently die at higher rates than females** across Malaysia.

---

## 🔴 **Districts with HIGHEST Male-to-Female Ratios (By Year)**

### 2020 Top 5
| Rank | District | State | Ratio | Male Deaths | Female Deaths |
|------|----------|-------|-------|-------------|---------------|
| 🥇 | Sipitang | Sabah | **2.19** | 140 | 64 |
| 🥈 | Tongod | Sabah | **1.88** | 77 | 41 |
| 🥉 | Cameron Highlands | Pahang | **1.84** | 103 | 56 |
| 4 | Belaga | Sarawak | **1.84** | 70 | 38 |
| 5 | Julau | Sarawak | **1.84** | 90 | 49 |

### 2021 Top 5
| Rank | District | State | Ratio | Male Deaths | Female Deaths |
|------|----------|-------|-------|-------------|---------------|
| 🥇 | Telupid | Sabah | **2.31** | 81 | 35 |
| 🥈 | Bau | Sarawak | **1.82** | 277 | 152 |
| 🥉 | Telang Usan | Sarawak | **1.80** | 79 | 44 |
| 4 | Belaga | Sarawak | **1.70** | 80 | 47 |
| 5 | Beluru | Sarawak | **1.69** | 127 | 75 |

### 2022 Top 5
| Rank | District | State | Ratio | Male Deaths | Female Deaths |
|------|----------|-------|-------|-------------|---------------|
| 🥇 | Kalabakan | Sabah | **2.62** | 68 | 26 |
| 🥈 | Putatan | Sabah | **2.19** | 230 | 105 |
| 🥉 | Tongod | Sabah | **2.00** | 88 | 44 |
| 4 | Kinabatangan | Sabah | **1.99** | 177 | 89 |
| 5 | Belaga | Sarawak | **1.89** | 72 | 38 |

### 2023 Top 5
| Rank | District | State | Ratio | Male Deaths | Female Deaths |
|------|----------|-------|-------|-------------|---------------|
| 🥇 | Telupid | Sabah | **3.67** | 77 | 21 |
| 🥈 | Nabawan | Sabah | **1.88** | 98 | 52 |
| 🥉 | Tongod | Sabah | **1.86** | 95 | 51 |
| 4 | Telang Usan | Sarawak | **1.82** | 89 | 49 |
| 5 | Jelebu | Negeri Sembilan | **1.62** | 235 | 145 |

> **Finding**: **Sabah dominates** the highest ratio rankings, with Telupid recording an **extreme ratio of 3.67 in 2023** — meaning **nearly 4 males die for every 1 female**.

---

## 🟢 **Districts with LOWEST Male-to-Female Ratios (Closest to Parity)**

### Notable Low Ratios (<1.10)
| Year | District | State | Ratio | Male Deaths | Female Deaths |
|------|----------|-------|-------|-------------|---------------|
| 2020 | Matu | Sarawak | **0.75** | 51 | 68 |
| 2020 | Yan | Kedah | **1.10** | 262 | 239 |
| 2021 | Rembau | Negeri Sembilan | **0.98** | 257 | 263 |
| 2021 | Sik | Kedah | **1.06** | 360 | 339 |
| 2021 | Yan | Kedah | **1.01** | 297 | 293 |
| 2022 | Selama | Perak | **1.02** | 213 | 209 |
| 2022 | Tebedu | Sarawak | **1.01** | 102 | 101 |
| 2023 | Sipitang | Sabah | **1.02** | 126 | 124 |

> **Finding**: Matu (Sarawak) recorded the **only ratio below 1.00** in 2020 (0.75), meaning more female deaths than males — a rare exception to the national pattern.

---

## 📊 **State-Level Average Ratios (2020-2023)**

| State | 2020 Avg | 2021 Avg | 2022 Avg | 2023 Avg | 4-Year Avg | Trend |
|-------|----------|----------|----------|----------|------------|-------|
| **Johor** | 1.46 | 1.36 | 1.34 | 1.36 | **1.38** | Stable |
| **Kedah** | 1.28 | 1.19 | 1.24 | 1.25 | **1.24** | Stable |
| **Kelantan** | 1.35 | 1.24 | 1.24 | 1.23 | **1.27** | Declining |
| **Melaka** | 1.27 | 1.24 | 1.22 | 1.22 | **1.24** | Stable |
| **Negeri Sembilan** | 1.34 | 1.26 | 1.30 | 1.36 | **1.32** | Variable |
| **Pahang** | 1.49 | 1.45 | 1.46 | 1.37 | **1.44** | Declining |
| **Perak** | 1.30 | 1.27 | 1.30 | 1.29 | **1.29** | Stable |
| **Perlis** | 1.22 | 1.26 | 1.26 | 1.19 | **1.23** | Stable |
| **Pulau Pinang** | 1.32 | 1.28 | 1.32 | 1.28 | **1.30** | Stable |
| **Sabah** | 1.51 | 1.35 | 1.49 | 1.46 | **1.45** | Variable |
| **Sarawak** | 1.39 | 1.37 | 1.33 | 1.29 | **1.35** | **Declining** |
| **Selangor** | 1.43 | 1.40 | 1.41 | 1.41 | **1.41** | Stable |
| **Terengganu** | 1.38 | 1.20 | 1.23 | 1.30 | **1.28** | Variable |
| **W.P. Kuala Lumpur** | 1.36 | 1.36 | 1.34 | 1.34 | **1.35** | Stable |
| **W.P. Labuan** | 1.33 | 1.38 | 1.25 | 1.40 | **1.34** | Variable |
| **W.P. Putrajaya** | 1.28 | 1.38 | 1.22 | 1.39 | **1.32** | Variable |

---

## 🏆 **State Rankings by Average Male-to-Female Ratio**

| Rank | State | 4-Year Avg Ratio | Interpretation |
|------|-------|------------------|----------------|
| 🥇 | **Sabah** | 1.45 | **Highest male mortality advantage** |
| 🥈 | **Pahang** | 1.44 | 2nd highest |
| 🥉 | **Selangor** | 1.41 | 3rd highest |
| 4 | **Johor** | 1.38 | Above national average |
| 5 | **Sarawak** | 1.35 | At national average |
| 6 | **W.P. Kuala Lumpur** | 1.35 | At national average |
| 7 | **W.P. Labuan** | 1.34 | Slightly below average |
| 8 | **Negeri Sembilan** | 1.32 | Below average |
| 9 | **W.P. Putrajaya** | 1.32 | Below average |
| 10 | **Pulau Pinang** | 1.30 | Below average |
| 11 | **Perak** | 1.29 | Below average |
| 12 | **Terengganu** | 1.28 | Below average |
| 13 | **Kelantan** | 1.27 | Below average |
| 14 | **Kedah** | 1.24 | **Lowest among major states** |
| 15 | **Melaka** | 1.24 | Tied for lowest |
| 16 | **Perlis** | 1.23 | **Lowest overall** |

> **Finding**: **Sabah (1.45)** and **Pahang (1.44)** have the highest male-to-female death ratios, while **Perlis (1.23)** and **Kedah (1.24)** have the lowest — a significant geographic disparity.

---

## 📈 **Trend Analysis: States with Improving Gender Parity**

### States Showing Declining Ratios (Moving Toward Parity)
| State | 2020 Ratio | 2023 Ratio | Change | Trend |
|-------|------------|------------|--------|-------|
| **Sarawak** | 1.39 | 1.29 | **-0.10** | 📉 Improving |
| **Kelantan** | 1.35 | 1.23 | **-0.12** | 📉 Improving |
| **Pahang** | 1.49 | 1.37 | **-0.12** | 📉 Improving |
| **Terengganu** | 1.38 | 1.30 | **-0.08** | 📉 Improving |

### States Showing Increasing Ratios (Widening Gap)
| State | 2020 Ratio | 2023 Ratio | Change | Trend |
|-------|------------|------------|--------|-------|
| **W.P. Putrajaya** | 1.28 | 1.39 | **+0.11** | 📈 Worsening |
| **W.P. Labuan** | 1.33 | 1.40 | **+0.07** | 📈 Worsening |
| **Negeri Sembilan** | 1.34 | 1.36 | **+0.02** | 📈 Slightly worsening |

> **Insight**: Sarawak, Kelantan, and Pahang show the **most improvement** toward gender parity, while Putrajaya's gap is widening.

---

## 💡 Key Insights

### 1. **Universal Male Disadvantage**
> **Finding**: Across **all states and years**, male deaths exceed female deaths in **over 98% of district-year observations**.

**Implication**: Male mortality is a **persistent, nationwide phenomenon** requiring targeted public health interventions.

### 2. **Sabah's Extreme Outliers**
| District | Year | Ratio | Significance |
|----------|------|-------|--------------|
| Telupid | 2023 | **3.67** | National record — 4:1 male:female ratio |
| Kalabakan | 2022 | **2.62** | Extreme disparity |
| Putatan | 2022 | **2.19** | More than 2:1 |

> **Insight**: Sabah contains Malaysia's most extreme gender disparities, suggesting **occupational hazards** (logging, fishing) or **migration patterns** (male workers) as potential factors.

### 3. **The Sarawak Improvement Story**
| Year | Sarawak Avg Ratio | Change |
|------|-------------------|--------|
| 2020 | 1.39 | Baseline |
| 2021 | 1.37 | -0.02 |
| 2022 | 1.33 | -0.04 |
| 2023 | 1.29 | -0.04 |

> **Finding**: Sarawak has shown **consistent improvement** year-over-year, moving closer to gender parity.

### 4. **Urban-Rural Divide**
| District Type | Example | Avg Ratio | Pattern |
|---------------|---------|-----------|---------|
| **Rural/Interior** | Telupid, Tongod, Belaga | >1.60 | Extreme disparities |
| **Urban Centers** | Petaling, Johor Bahru, Kuching | 1.30-1.40 | Moderate disparities |
| **Administrative** | Putrajaya | 1.32 | Lower disparities |

> **Insight**: Rural and interior districts show **much larger gender gaps** than urban centers, suggesting healthcare access and occupational factors play key roles.

### 5. **The Matu Anomaly (2020)**
> **Finding**: Matu (Sarawak) recorded a ratio of **0.75 in 2020** — the only district where female deaths significantly exceeded male deaths.

**Implication**: Investigate potential causes — could be data anomaly, specific health event affecting women, or male out-migration.

---

## 📊 **Year-by-Year Extreme Values**

| Year | Highest Ratio | District | Lowest Ratio | District |
|------|---------------|----------|--------------|----------|
| 2020 | 2.19 | Sipitang (Sabah) | 0.75 | Matu (Sarawak) |
| 2021 | 2.31 | Telupid (Sabah) | 0.80 | Pusa/Bukit Mabong (Sarawak) |
| 2022 | 2.62 | Kalabakan (Sabah) | 1.01 | Tebedu (Sarawak) |
| 2023 | 3.67 | Telupid (Sabah) | 1.02 | Sipitang (Sabah) |

> **Finding**: The **range of ratios has widened** over time — from 0.75-2.19 in 2020 to 1.02-3.67 in 2023 — indicating increasing disparity between best and worst districts.

---

# 14.  Compare rate categories with death counts?
<img width="607" height="556" alt="Screenshot 2026-03-05 110749" src="https://github.com/user-attachments/assets/7812ac0f-2547-4812-8fd1-7c5a1bb4ee79" />

## 📊 Sabah Death Rate Categories Analysis

### Overview
This analysis categorizes Sabah's districts by death rate ranges and compares average death counts, rate ranges, and total deaths across categories.

---

## 📈 Rate Category Classification

| Category | Rate Range | Risk Level |
|----------|------------|------------|
| **Very Low** | 0-5 | 🟢 **Lowest Risk** |
| **Low** | 5-10 | 🟡 **Moderate Risk** |
| **Medium-Low** | 10-15 | 🟠 **Elevated Risk** |
| **Medium** | 15-20 | 🔴 **High Risk** |
| **Medium-High** | 20-25 | 🔴 **Critical** |
| **High** | 25-30 | 🔴 **Severe** |
| **Very High** | >30 | 🔴 **Extreme** |

---

## 🟢 **Very Low Rate Category (0-5) — Best Performing Districts**

| District | Avg Deaths | Min Rate | Max Rate | Total Deaths | Stability |
|----------|------------|----------|----------|--------------|-----------|
| **Kinabatangan** | 118.3 | 1.06 | 2.30 | 946 | 🟢 **Most Stable** |
| **Kalabakan** | 57.8 | 1.24 | 2.66 | 347 | 🟢 Excellent |
| **Kota Kinabalu** | 992.3 | 2.89 | 4.96 | 7,938 | 🟢 High Volume |
| **Penampang** | 318.3 | 2.92 | 4.68 | 1,910 | 🟢 Good |
| **Putatan** | 116.7 | 3.19 | 3.97 | 350 | 🟢 Good |
| **Sandakan** | 866.1 | 3.15 | 4.53 | 6,063 | 🟢 Good |
| **Tongod** | 68.4 | 2.09 | 3.99 | 547 | 🟢 Good |
| **Lahad Datu** | 404.8 | 2.26 | 4.39 | 3,238 | 🟢 Good |
| **Kunak** | 121.5 | 2.40 | 4.21 | 972 | 🟢 Good |
| **Semporna** | 364.2 | 3.56 | 4.88 | 2,185 | 🟢 Good |
| **Tawau** | 761.6 | 3.17 | 4.95 | 5,331 | 🟢 Good |
| **Beluran** | 162.7 | 3.83 | 4.52 | 1,139 | 🟢 Good |
| **Keningau** | 335.8 | 4.10 | 4.99 | 1,343 | 🟢 Good |
| **Kudat** | 203.0 | 4.78 | 4.78 | 203 | 🟢 Single entry |
| **Papar** | 344.0 | 4.78 | 4.78 | 344 | 🟢 Single entry |
| **Nabawan** | 60.0 | 3.61 | 4.97 | 240 | 🟢 Good |
| **Sipitang** | 64.0 | 3.52 | 3.52 | 64 | 🟢 Single entry |
| **Telupid** | 44.0 | 1.52 | 4.67 | 176 | 🟢 Variable |

---

## 🟡 **Low Rate Category (5-10) — Moderate Risk Districts**

| District | Avg Deaths | Min Rate | Max Rate | Total Deaths | Notes |
|----------|------------|----------|----------|--------------|-------|
| **Tuaran** | 483.8 | 5.39 | 8.37 | 3,870 | Wide range |
| **Keningau** | 486.5 | 5.58 | 6.98 | 1,946 | Narrow range |
| **Papar** | 503.3 | 5.54 | 7.34 | 3,523 | Moderate |
| **Ranau** | 282.3 | 5.52 | 7.55 | 2,258 | Moderate |
| **Kota Belud** | 404.9 | 5.95 | 8.83 | 3,239 | Wide range |
| **Kota Marudu** | 266.4 | 5.74 | 9.78 | 1,865 | Wide range |
| **Kudat** | 324.1 | 5.09 | 9.66 | 2,269 | Wide range |
| **Tenom** | 193.7 | 5.00 | 9.89 | 1,356 | Wide range |
| **Pitas** | 162.3 | 7.80 | 9.79 | 974 | Narrow high-end |
| **Beaufort** | 301.5 | 6.32 | 9.50 | 1,809 | Moderate |
| **Sipitang** | 139.9 | 6.15 | 8.54 | 979 | Moderate |
| **Tambunan** | 130.1 | 6.03 | 9.58 | 1,041 | Wide range |
| **Kuala Penyu** | 102.5 | 6.69 | 9.83 | 410 | Wide range |
| **Tawau** | 1,181.0 | 6.06 | 6.06 | 1,181 | Single entry |
| **Sandakan** | 1,220.0 | 5.49 | 5.49 | 1,220 | Single entry |
| **Penampang** | 520.0 | 5.95 | 6.00 | 1,040 | Narrow |
| **Semporna** | 427.0 | 5.00 | 5.22 | 854 | Narrow |
| **Beluran** | 214.0 | 5.13 | 5.13 | 214 | Single entry |
| **Nabawan** | 88.8 | 5.35 | 6.38 | 355 | Narrow |
| **Putatan** | 206.6 | 5.22 | 6.34 | 1,033 | Narrow |
| **Telupid** | 81.5 | 5.00 | 5.22 | 163 | Narrow |

---

## 🟠 **Medium-Low Rate Category (10-15) — Elevated Risk Districts**

| District | Avg Deaths | Min Rate | Max Rate | Total Deaths | Risk Level |
|----------|------------|----------|----------|--------------|------------|
| **Kuala Penyu** | 154.8 | 10.67 | 14.26 | 619 | 🟠 **Elevated** |
| **Pitas** | 227.5 | 11.67 | 11.79 | 455 | 🟠 Elevated |
| **Kota Marudu** | 363.0 | 10.06 | 10.06 | 363 | 🟠 Elevated |
| **Beaufort** | 424.5 | 10.61 | 10.88 | 849 | 🟠 Elevated |
| **Tenom** | 286.0 | 10.71 | 10.71 | 286 | 🟠 Elevated |

---

## 🔍 Key Findings

### 📊 **Category Distribution in Sabah**

| Category | Number of Districts | Total Deaths | % of Sabah Deaths |
|----------|---------------------|--------------|-------------------|
| 🟢 **Very Low (0-5)** | 18 districts | 33,072 | **49.0%** |
| 🟡 **Low (5-10)** | 21 districts | 33,057 | **49.0%** |
| 🟠 **Medium-Low (10-15)** | 5 districts | 2,572 | **3.8%** |
| 🔴 **Medium (15-20)** | 0 | 0 | 0% |
| 🔴 **High (20-25)** | 0 | 0 | 0% |
| 🔴 **Very High (>30)** | 0 | 0 | 0% |

> **Finding**: **98% of Sabah's deaths** occur in districts with rates below 10, split almost equally between Very Low (49%) and Low (49%) categories.

---

### 🏆 **Very Low Category Champions (0-5)**

#### Top 5 by Total Deaths
| Rank | District | Total Deaths | Avg Rate Range | Performance |
|------|----------|--------------|----------------|-------------|
| 🥇 | **Kota Kinabalu** | 7,938 | 2.89-4.96 | 🟢 **Exemplary** |
| 🥈 | **Sandakan** | 6,063 | 3.15-4.53 | 🟢 Excellent |
| 🥉 | **Tawau** | 5,331 | 3.17-4.95 | 🟢 Excellent |
| 4 | **Lahad Datu** | 3,238 | 2.26-4.39 | 🟢 Excellent |
| 5 | **Semporna** | 2,185 | 3.56-4.88 | 🟢 Excellent |

> **Insight**: Sabah's **major population centers** (Kota Kinabalu, Sandakan, Tawau) achieve **Very Low rates** while handling the highest death volumes — the ideal combination.

#### Lowest Rates in Very Low Category
| District | Min Rate | Max Rate | Avg Rate | Stability |
|----------|----------|----------|----------|-----------|
| **Kinabatangan** | 1.06 | 2.30 | ~1.66 | 🟢 **Most Stable** |
| **Kalabakan** | 1.24 | 2.66 | ~2.27 | 🟢 Excellent |
| **Tongod** | 2.09 | 3.99 | ~3.15 | 🟢 Good |
| **Kunak** | 2.40 | 4.21 | ~3.47 | 🟢 Good |
| **Lahad Datu** | 2.26 | 4.39 | ~3.45 | 🟢 Good |

> **Finding**: **Kinabatangan (1.06-2.30)** remains Sabah's lowest-rate district, followed by Kalabakan and Tongod.

---

### 🟡 **Low Category Insights (5-10)**

#### Highest Death Volumes in Low Category
| District | Total Deaths | Rate Range | Challenge |
|----------|--------------|------------|-----------|
| **Tuaran** | 3,870 | 5.39-8.37 | Moderate volume, moderate rates |
| **Papar** | 3,523 | 5.54-7.34 | Moderate volume |
| **Kota Belud** | 3,239 | 5.95-8.83 | Wide range |
| **Ranau** | 2,258 | 5.52-7.55 | Stable moderate |
| **Kudat** | 2,269 | 5.09-9.66 | Wide range |

#### Districts with Wide Rate Ranges (Unstable in Low Category)
| District | Min | Max | Range | Volatility |
|----------|-----|-----|-------|------------|
| **Tenom** | 5.00 | 9.89 | 4.89 | 🔴 High |
| **Kota Marudu** | 5.74 | 9.78 | 4.04 | 🔴 High |
| **Kudat** | 5.09 | 9.66 | 4.57 | 🔴 High |
| **Kota Belud** | 5.95 | 8.83 | 2.88 | 🟡 Moderate |
| **Tambunan** | 6.03 | 9.58 | 3.55 | 🟡 Moderate |

> **Insight**: Several Low category districts show **wide rate ranges** (up to 4.89 points), indicating inconsistency despite moderate averages.

---

### 🟠 **Medium-Low Category Crisis Districts (10-15)**

#### The 5 Elevated Risk Districts
| District | Total Deaths | Rate Range | Risk Level |
|----------|--------------|------------|------------|
| **Beaufort** | 849 | 10.61-10.88 | 🟠 **Elevated** |
| **Kuala Penyu** | 619 | 10.67-14.26 | 🟠 Elevated |
| **Pitas** | 455 | 11.67-11.79 | 🟠 Elevated |
| **Kota Marudu** | 363 | 10.06-10.06 | 🟠 Elevated |
| **Tenom** | 286 | 10.71-10.71 | 🟠 Elevated |

> **Finding**: These **5 districts** represent Sabah's highest mortality risk, with rates consistently above 10. **Kuala Penyu** shows the widest range (10.67-14.26), indicating volatility.

---

## 📊 **Volume Analysis by Category**

### Very Low Category (0-5) — 18 districts
| Metric | Value |
|--------|-------|
| **Total Deaths** | 33,072 |
| **Average per District** | 1,837 |
| **Highest Volume** | Kota Kinabalu (7,938) |
| **Lowest Volume** | Kalabakan (347) |

### Low Category (5-10) — 21 districts
| Metric | Value |
|--------|-------|
| **Total Deaths** | 33,057 |
| **Average per District** | 1,574 |
| **Highest Volume** | Tuaran (3,870) |
| **Lowest Volume** | Telupid (163) |

### Medium-Low Category (10-15) — 5 districts
| Metric | Value |
|--------|-------|
| **Total Deaths** | 2,572 |
| **Average per District** | 514 |
| **Highest Volume** | Beaufort (849) |
| **Lowest Volume** | Tenom (286) |

> **Insight**: The **Very Low and Low categories each account for ~33,000 deaths** — nearly identical totals — but the Very Low category achieves this with **fewer districts (18 vs 21)** , indicating higher efficiency.

---

# 👇Full SQL query-code-analysis👇
-<a href="https://github.com/Donovandonz/SQL--death-rate-analysis/blob/main/death_rate_analysis_db.sql">Death-rate-SQL-query-code-analysis</a>

---

# Dashboard Overview
-<a href="https://github.com/Donovandonz/Tableau--death-rate-dashboard-and-analysis">Tableau-death-rate-dashboard</a>

<img width="1999" height="1124" alt="Death Rate Dashboard" src="https://github.com/user-attachments/assets/c772b5bf-0287-45b5-812c-8580a70ee9a2" />







