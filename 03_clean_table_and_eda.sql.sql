-- Let's create a new clean table after data cleaning to perform Exploratory Date Analysid (EDA)

CREATE TABLE bank_marketing_clean LIKE
bank_marketing_staging_table;

INSERT INTO bank_marketing_clean
SELECT *
FROM
bank_marketing_staging_table;

-- After we create a new clean table le'ts drop the staging table

DROP TABLE
bank_marketing_staging_table;

-- SQL Project - Exploratory Data Analysis (EDA)
-- 1. What is the total number of customers ?

SELECT COUNT(*) AS total_customers 
FROM
bank_marketing_clean;

-- 2. How many customers subscribed to the term deposit ?

SELECT COUNT(*) AS customers_term_deposit
FROM
bank_marketing_clean
WHERE class = 1;

-- 3. What is the average age of customers ?

SELECT ROUND(AVG(V1), 2) AS average_age
FROM 
bank_marketing_clean;

-- 4. What is the average yearly balance ?

SELECT ROUND(AVG(V6), 2)
FROM
bank_marketing_clean;

-- 5. What is the average call duration

SELECT ROUND(AVG(V12), 2) AS average_call_duration
FROM
bank_marketing_clean;

-- 6. What is the distribution of customers by job ?

SELECT COUNT(V2) AS distribution_customers,
       V2 AS job
FROM
bank_marketing_clean
WHERE V2 = "management" 
OR V2 = "technician"
OR V2 = "entrepreneur"
OR V2 = "blue-collar"
OR V2 = "unknown"
OR V2 = "retired"
OR V2 = "admin"
OR V2 = "services"
OR V2 = "self-employed"
OR V2 = "unemployed"
OR V2 = "housemaid"
OR V2 = "student"
GROUP BY job;

-- 7. What is the distribution of customers by marital status ?

SELECT COUNT(V3) AS distribution_customers,
       V3 AS marital_status
FROM
bank_marketing_clean
WHERE V3 = "married" 
OR V3 = "single"
OR V3 = "divorced"
GROUP BY marital_status;

-- 8. What is the distribution of customers by education level ?

SELECT COUNT(V4) AS distribution_customers,
       V4 AS education_level
FROM
bank_marketing_clean
WHERE V4 = "tertiary" 
OR V4 = "secondary"
OR V4 = "unknown"
OR V4 = "primary"
GROUP BY education_level;

-- 9. Which age group has the highest number of customer ?

SELECT COUNT(V1) AS number_of_customers,
CASE 
	WHEN V1 BETWEEN 18 AND 25 THEN "18-25"
    WHEN V1 BETWEEN 26 AND 35 THEN "26-35"
    WHEN V1 BETWEEN 36 AND 45 THEN "36-45"
    WHEN V1 BETWEEN 46 AND 55 THEN "46-55"
    WHEN V1 >= 56 THEN "56+"
END 
AS age_group
FROM
bank_marketing_clean
GROUP BY age_group
ORDER BY number_of_customers DESC
LIMIT 1;

-- 10. Which job has the average yearly balance ?

SELECT V2 AS job,
       ROUND(AVG(V6), 2) AS avg_yearly_balance
FROM
bank_marketing_clean
GROUP BY job
ORDER BY avg_yearly_balance DESC
LIMIT 1;

-- 11. What is the average balance by education level ?

SELECT V4 AS education_level,
       ROUND(AVG(V6), 2) AS avg_balance
FROM
bank_marketing_clean
GROUP BY education_level
ORDER BY avg_balance DESC;

-- 12. Which marital status has the highest average balance ?

SELECT V3 AS marital_status,
       ROUND(AVG(V6), 2) AS avg_balance
FROM
bank_marketing_clean
GROUP BY marital_status
ORDER BY avg_balance DESC
LIMIT 1;

-- 13. Which contact method was used frequently ?

SELECT V9 AS number_of_customers,
      COUNT(V9) AS contact_method
FROM
bank_marketing_clean
GROUP BY number_of_customers
ORDER BY contact_method DESC
LIMIT 1;

-- 14. Which month had the highest number of marketing contacts ?

SELECT COUNT(*) AS marketing_contacts,
       V11 AS month
FROM
bank_marketing_clean
GROUP BY month
ORDER BY marketing_contacts DESC
LIMIT 1;

-- 15. What is the average call duration by month ?

SELECT V11 AS month,
       ROUND(AVG(V12), 2) AS avg_call_duration
FROM
bank_marketing_clean
GROUP BY month;

-- 16. Which compaign had the highest subscription rate ?
-- Calculate the total customers and subscribers for each compaign

SELECT V13 AS compaign,
       COUNT(*) AS total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY compaign;

-- Find the compaign with the highest subscription rate

WITH highest_subscription_rate AS
(
SELECT V13 AS compaign,
       COUNT(*) AS total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY compaign
)
SELECT compaign,
       ROUND((subscribers / total_customers) * 100, 2) AS subscription_rate
FROM 
highest_subscription_rate
ORDER BY subscription_rate DESC
LIMIT 1;

-- 17. Which jobs have the highest subscription rate ?
-- Calculate the subscription rate for each job

SELECT V2 AS job,
       COUNT(*) AS total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY job;

-- Display jobs ranked by subscription rate 

WITH highest_subscription_rate AS
(
SELECT V2 AS job,
       COUNT(*) AS total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY job
)
SELECT job,
       ROUND((subscribers / total_customers) * 100, 2) AS subscription_rate
FROM
highest_subscription_rate
GROUP BY job
ORDER BY subscription_rate DESC
LIMIT 1;
       
-- 18. Which education level has the highest subscription rate ?
-- Calculate the subscription rate for each education level 
 
SELECT V4 AS education_level,
       COUNT(*) AS total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY education_level;

-- Display education levels ranked by subscription rate

WITH highest_subscription_rate AS
(
SELECT V4 AS education_level,
       COUNT(*) AS total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY education_level
) 
SELECT education_level,
       ROUND((subscribers / total_customers) * 100, 2) AS subscription_rate
FROM
highest_subscription_rate
GROUP BY education_level
ORDER BY subscription_rate DESC
LIMIT 1;

-- 19. Which the marital status has the highest subscription rate ?
-- Calculate the subscription rate for each marital status

SELECT V3 AS marital_status,
       COUNT(*) AS total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY marital_status;

-- Display marital_status ranked by subscription rate

WITH highest_subscription_rate AS
(
SELECT V3 AS marital_status,
       COUNT(*) AS total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY marital_status
)
SELECT marital_status,
       ROUND((subscribers / total_customers) * 100, 2) AS subscription_rate
FROM
highest_subscription_rate
GROUP BY marital_status
ORDER BY subscription_rate DESC
LIMIT 1;

-- 20. Which contact method results in the highest subscription rate ?
-- Calculate the subscription rate for each contact method

SELECT V9 AS contact_method,
       COUNT(*) total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY contact_method;

-- Display contact method ranked by subscription rate 

WITH highest_subscription_rate AS
(
SELECT V9 AS contact_method,
       COUNT(*) total_customers,
       COUNT(CASE WHEN class = 2 THEN 1 END) AS subscribers
FROM
bank_marketing_clean
GROUP BY contact_method
)
SELECT contact_method,
       ROUND((subscribers / total_customers) * 100, 2) AS subscription_rate
FROM
highest_subscription_rate
GROUP BY contact_method
ORDER BY subscription_rate DESC
LIMIT 1;

-- 21. Rank jobs by average yearly balance
-- Calculate the average yearly balance for each job

SELECT V2 AS jobs,
       ROUND(AVG(V6), 2) AS avg_yearly_balance
FROM
bank_marketing_clean
GROUP BY jobs;

-- Rank jobs by average yearly balance

WITH job_balance AS
(
SELECT V2 AS jobs,
       ROUND(AVG(V6), 2) AS avg_yearly_balance
FROM
bank_marketing_clean
GROUP BY jobs
) 
SELECT jobs,
       RANK() OVER (ORDER BY avg_yearly_balance) AS avg_balance_rank
FROM
job_balance
GROUP BY jobs;

-- 22. Rank months by number of successfull subscriptions
-- Calculate the number of successfull subscriptions for each month

SELECT V11 AS months,
	   COUNT(CASE WHEN class = 2 THEN 1 END) AS successfull_subscriptions
FROM
bank_marketing_clean
GROUP BY months;

-- Rank months by the number of successfull subscriptions

WITH monthly_subscriptions AS
(
SELECT V11 AS months,
	   COUNT(CASE WHEN class = 2 THEN 1 END) AS successfull_subscriptions
FROM
bank_marketing_clean
GROUP BY months
)
SELECT months,
       RANK() OVER (ORDER BY successfull_subscriptions) AS subscription_rank
FROM
monthly_subscriptions
GROUP BY months;

-- 23. Find the top 5 jobs with the highest average balance

SELECT V2 AS jobs,
       ROUND(AVG(V6), 2) AS highest_average_balance
FROM
bank_marketing_clean
GROUP BY jobs
ORDER BY highest_average_balance DESC
LIMIT 5;

-- 24. Compare the average age of customers who subscribed and those who did not

SELECT ROUND(AVG(V1), 2) AS avg_age,
CASE
    WHEN class = 1 THEN "not_subscribed"
    WHEN class = 2 THEN "subscribed"
END
AS subscription_status
FROM
bank_marketing_clean
GROUP BY class
ORDER BY avg_age DESC;