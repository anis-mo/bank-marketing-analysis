# 🏦Bank Marketing Data Analysis Using MySQL

## 📌Project Overview

This project analyzes a bank marketing dataset using MySQL. The main objective is to clean the raw data. perform exploratory data analysis (EDA), and extract meaningful business insights that can support marketing decisions.

---

## Objectives

- Clean and prepare the dataset for analysis.
- Explore customer demographics and financial information.
- Analyze customer subscription behavior.
- Identify patterns that influence term deposit subscription.
- Practice SQL for real-world data analysis.

---

# 🗒️Dataset 

The dataset contains customer information collected from a bank marketing campaign.

Main features include:

- V1 = Age of the client.
- V2 = Type of job (e.g., admin, management, student).
- V3 = Marital status (married, divorced, single).
- V4 = Education level (primary, secondary, tertiary, unknown).
- V5 = Has credit in default? (yes, no).
- V6 = Average yearly balance, in euros
- V7 = Has a housing loan? (yes, no).
- V8 = Has a personal loan? (yes, no).
- V9 = Contact communication type (telephone, cellular, unknown).
- V10 = Last contact day of the month (1-31).
- V11 = Last contact month of the year (jan-dec).
- V12 = Last contact duration, in seconds. (Note: highly correlated with the target).
- V13 = Number of contacts performed during this campaign for this client.
- V14 = Number of days since the client was last contacted from a previous campaign (-1 means not previously).
- V15 = Number of contacts performed before this campaign for this client.
- V16 = Outcome of the previous marketing campaign (success, failure, other, unknown).
- Class = Target variable - Has the client subscribed to a term deposit? (1 = no, 2 = yes).

---

## 🧹Data Cleaning

The following cleaning steps were performed :

- Removed duplicate records.
- Verified data types.
- Checked for NULL values.
- Checked for blank values.
- Renamed columns for better readability.
- Reviewed unknown values.
- Prepared the dataset for analysis.

---

# 🔎Exploratory Data Analysis (EDA)

The analysis answers questions such as:

- How many customers are in dataset?
- What is the distribution of customers by job?
- What is the distribution of customers by marital status?
- Which age group has the highest number of customers?
- What is the average yearly balance by job?
- What is the average yearly balance by education level?
- Which contact method is used most frequently?
- Which month has the highest number of marketing contacts?
- What is the average call duration by month?
- Which campaign has the highest subscription rate?
- Which job has the highest subscription rate?
- Rank jobs by average yearly balance.
- Rank months by successful subscriptions.
- Compare the average age of subscribed and non-subscribed customers.

---

## 📊SQL Concepts Used

- SELECT
- WHERE 
- ORDER BY
- GROUP BY
- CASE
- COUNT()
- SUM()
- AVG()
- ROUND()
- LIMIT
- CTEs (Common Table Expressions)
- Window Functions 
  - RANK()
  - LAG()

---

# 🛠️Tools Used

- MySQL
- MySQL Workbench

---

## 🎯Key Insights

- Customer Segmentation: Explored customer characteristics, including age and occupation, to understand differences between customer groups.
- Subscription Outcomes: Analyzed subscription outcomes to identify patterns in customer responses to marketing campaigns.
- Occupation Analysis: Compared subscription rates across different occupational groups.
- Account Balance: Examined yearly account balances and their distribution across customer segments.
- Data Quality: Handled missing values and inconsistent text entries to improve data reliability.
- SQL-Based Analysis: Used filtering, aggregation, grouping, and ranking queries to explore customer data and marketing campaign performance.

---

## Project Structure

```
01_database_setup.sql
02_data_cleaning.sql
03_clean_table_and_eda.sql
README.md
```

## 💡Results

- Analyzed customer demographics, including age and other available customer characteristics.
- Explored the relationship between customers' occupations and subscription outcomes.
- Examined yearly account balances and compared customer groups.
- Investigated patterns in subscription outcomes across different customer segments.
- Cleaned inconsistent and missing values to improve data quality.
- Used SQL queries and exploratory data analysis (EDA) to identify patterns in customer data and marketing campaign outcomes.

---

## ✔️Conclusion 

This project used MySQL to analyze bank marketing data and explore customer characteristics and subscription outcomes. The analysis focused on customer segmentation, account balances, occupations, and marketing campaign results.

Through data cleaning, data transformation, aggregation, and exploratory SQL queries, I strengthened my skills in SQL and data analysis.

The project demonstrates how structured data analysis can help explore customer behavior, evaluate marketing outcomes, and support data-driven decisions in the banking sector.

## Author

anis-mo
