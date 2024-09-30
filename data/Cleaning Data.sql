-- CREATING A NEW TABLE FOR DATA CLEANING PROCESS --
CREATE TABLE online_sales_data_cleaning
LIKE online_sales_data;

INSERT online_sales_data_cleaning
SELECT *
FROM online_sales_data;

Select*
from online_sales_data_cleaning;

-- CHECKING DUPLICATES --
SELECT Transaction_ID, COUNT(*)
FROM online_sales_data_cleaning
GROUP BY Transaction_ID
HAVING COUNT(*) > 1;
-- No duplicate on Transaction_ID column --

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY Product_Category, Product_Name, Units_Sold, Total_Revenue, 
			 Region, Payment_Method) AS count
FROM online_sales_data_cleaning;
-- Counting the numbers of different data set based on Product_Category, Product_Name, Units_Sold, Total_Revenue, Region, and Payment_Method --

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY Product_Category, Product_Name, Units_Sold, Total_Revenue, 
			 Region, Payment_Method) AS count
FROM online_sales_data_cleaning
)
SELECT *
FROM duplicate_cte
WHERE count > 1;
-- Checking if there is any duplicate on those data set --
-- Conclusion: THERE IS NO DUPLICATE --

-- CHECKING MISSING VALUES --
SELECT *
FROM online_sales_data_cleaning
WHERE Transaction_ID IS NULL
   OR `Date` IS NULL
   OR Product_Category IS NULL
   OR Product_Name IS NULL
   OR Units_Sold IS NULL
   OR Unit_Price IS NULL
   OR Total_Revenue IS NULL
   OR Region IS NULL
   OR Payment_Method IS NULL;
-- Conclusion: THERE IS NO MISSING VALUES --

-- STANDARDIZING DATA --
UPDATE online_sales_data_cleaning
SET Product_Category = TRIM(Product_Category);

UPDATE online_sales_data_cleaning
SET Product_Name = TRIM(Product_Name);

UPDATE online_sales_data_cleaning
SET Region = TRIM(Region);

UPDATE online_sales_data_cleaning
SET Payment_Method = TRIM(Payment_Method);

-- Removing whitespace from string columns --

SELECT *
FROM online_sales_data_cleaning;

SELECT DISTINCT Product_Category
FROM online_sales_data_cleaning
ORDER BY 1;
-- Checking if there is any category in column that can be renamed --
-- Result: No value to rename --

SELECT DISTINCT Product_Name
FROM online_sales_data_cleaning
ORDER BY 1;
-- Checking if there is any product in column that can be merged by their brand name --
-- With criteria: More than one product transaction happened by the brand name  --

ALTER TABLE online_sales_data_cleaning
ADD COLUMN Brand_Name TEXT;

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Adidas'
WHERE Product_Name LIKE 'Adidas%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Amazon'
WHERE Product_Name LIKE 'Amazon%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Anova'
WHERE Product_Name LIKE 'Anova%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Apple'
WHERE Product_Name LIKE 'Apple%' OR Product_Name LIKE 'iPhone%' OR Product_Name LIKE 'MacBook%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Bose'
WHERE Product_Name LIKE 'Bose%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Bowflex'
WHERE Product_Name LIKE 'Bowflex%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Breville'
WHERE Product_Name LIKE 'Breville%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Canon'
WHERE Product_Name LIKE 'Canon%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Clinique'
WHERE Product_Name LIKE 'Clinique%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Cuisinart'
WHERE Product_Name LIKE 'Cuisinart%';

UPDATE online_sales_data_cleaning
SET Brand_Name = 'Dyson'
WHERE Product_Name LIKE 'Dyson%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Fitbit'
WHERE Product_Name LIKE 'Fitbit%';
    
UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Gap'
WHERE Product_Name LIKE 'Gap%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Garmin'
WHERE Product_Name LIKE 'Garmin%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Glossier'
WHERE Product_Name LIKE 'Glossier%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Google'
WHERE Product_Name LIKE 'Google%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'GoPro'
WHERE Product_Name LIKE 'GoPro%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Hydro Flask'
WHERE Product_Name LIKE 'Hydro Flask%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Instant Pot'
WHERE Product_Name LIKE 'Instant Pot%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Keurig'
WHERE Product_Name LIKE 'Keurig%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'KitchenAid'
WHERE Product_Name LIKE 'KitchenAid%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = "Levi's"
WHERE Product_Name LIKE "Levi's%";

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Logitech'
WHERE Product_Name LIKE 'Logitech%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Lululemon'
WHERE Product_Name LIKE 'Lululemon%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Nespresso'
WHERE Product_Name LIKE 'Nespresso%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Neutrogena'
WHERE Product_Name LIKE 'Neutrogena%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Nike'
WHERE Product_Name LIKE 'Nike%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Ninja'
WHERE Product_Name LIKE 'Ninja%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Old Navy'
WHERE Product_Name LIKE 'Old Navy%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Philips'
WHERE Product_Name LIKE 'Philips%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Samsung'
WHERE Product_Name LIKE 'Samsung%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Sony'
WHERE Product_Name LIKE 'Sony%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Sunday Riley'
WHERE Product_Name LIKE 'Sunday Riley%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'The Ordinary'
WHERE Product_Name LIKE 'The Ordinary%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Under Armour'
WHERE Product_Name LIKE 'Under Armour%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Uniqlo'
WHERE Product_Name LIKE 'Uniqlo%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'YETI'
WHERE Product_Name LIKE 'YETI%' OR Product_Name LIKE 'Yeti%';

UPDATE online_sales_data_cleaning 
SET Brand_Name = 'Others'
WHERE Brand_Name IS NULL;
-- Any products that only got purchased once got their Brand_Name as 'others' --

SELECT DISTINCT Product_Name, Brand_Name
FROM online_sales_data_cleaning
ORDER BY 1;

SELECT DISTINCT Region
FROM online_sales_data_cleaning
ORDER BY 1;
-- Checking if there is any category in column that can be renamed --
-- Result: No value to rename --

SELECT DISTINCT Payment_Method
FROM online_sales_data_cleaning
ORDER BY 1;
-- Checking if there is any category in column that can be renamed --
-- Result: No value to rename --


