-- SQL Project - DATA Cleaning

SELECT *
FROM
bank_marketing_table;

-- first thing we need to do is create a staging table. This is the one we will work in and clean the data. We want a table with the raw data in case something happens

CREATE TABLE bank_marketing_staging_table LIKE
bank_marketing_table;

INSERT INTO bank_marketing_staging_table
SELECT *
FROM
bank_marketing_table;

-- 1. Remove Duplicates
-- First let's check for duplicates

SELECT V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, Class,
       ROW_NUMBER() OVER (PARTITION BY  V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, Class) AS row_num
FROM
bank_marketing_staging_table;

-- After we check for duplicates let's move to the next step
-- 2. Standardize the data

SELECT V2, V3, V4, V5, V7, V8, V9, V11, V16
FROM
bank_marketing_staging_table;

-- Check for trailling periods

SELECT V2
FROM
bank_marketing_staging_table
WHERE V2 LIKE '%.';

-- Remove trailling periods to standarize values

UPDATE 
bank_marketing_staging_table 
SET V2 = TRIM(TRAILING '.' FROM V2 )
WHERE V2 LIKE '%.';

-- Let's check for update

SELECT V2
FROM
bank_marketing_staging_table
WHERE V2 LIKE 'ad%';

-- Let's look into data type

SELECT *
FROM
bank_marketing_staging_table;

-- Data types are correct, no changes required
-- 3. NULL and Blank values

SELECT *
FROM
bank_marketing_staging_table
WHERE V1 IS NULL
      OR TRIM(V2) = ' '
      OR TRIM(V3) = ' '
      OR TRIM(V4) = ' '
      OR TRIM(V5) = ' '
      OR V6 IS NULL
      OR TRIM(V7) = ' '
      OR TRIM(V8) = ' '
      OR TRIM(V9) = ' '
      OR V10 IS NULL
      OR TRIM(V11) = ' '
      OR V12 IS NULL
      OR V13 IS NULL
      OR V14 IS NULL
      OR V15 IS NULL
      OR TRIM(V16) = ' '
      OR Class IS NULL;
      
-- Checked for NULL and Blank values, No issues found
-- 4. Remove unnecessary columns or rows

SELECT *
FROM
bank_marketing_staging_table;

SELECT DISTINCT(V9)
FROM
bank_marketing_staging_table;

SELECT DISTINCT(V16)
FROM
bank_marketing_staging_table;

-- no unnecessary rows or columns, all is useful and important 


