----Create Table 
CREATE OR REPLACE TABLE luisalva.walmart_dataset.sales(
	  invoice_id STRING PRIMARY KEY,
    branch STRING NOT NULL,
    city STRING NOT NULL,
    customer_type STRING NOT NULL,
    gender STRING NOT NULL,
    product_line STRING NOT NULL,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    tax_pct DECIMAL NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment STRING NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct DECIMAL (11,9),
    gross_income DECIMAL(12, 4),
    rating DECIMAL(2, 1)
);

-------------Feature Engineering------------------------

----------- Create time_of_day column
ALTER TABLE luisalva.walmart_dataset.walmart_sales 
	ADD COLUMN time_of_day STRING;

 UPDATE
  `luisalva.walmart_dataset.walmart_sales`
SET 
  time_of_day = (
    CASE
      WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
      WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
    ELSE "Evening"
  END
    )
 WHERE time_of_day IS NULL;

-------------- Create day_of_week column
ALTER TABLE luisalva.walmart_dataset.walmart_sales 
	ADD COLUMN day_of_week STRING;

UPDATE
  luisalva.walmart_dataset.walmart_sales
SET
  day_of_week = format_date('%A', date)
WHERE
  day_of_week IS NULL;

-------------- Create month column
ALTER TABLE luisalva.walmart_dataset.walmart_sales 
	ADD COLUMN month STRING;  

UPDATE
  luisalva.walmart_dataset.walmart_sales
SET
  month = format_date('%B', date)
WHERE
  month IS NULL;


-------------- Exploratory questions
  --Exploratory Analysis
  ---How many nunique purchases/customers does the dataset has?
SELECT
  COUNT (DISTINCT invoice_id)
FROM
  luisalva.walmart_dataset.walmart_sales;


---How many unique cities does the dataset has?
SELECT
  DISTINCT city
FROM
  luisalva.walmart_dataset.walmart_sales;


---Purchases by city
SELECT
  city,
  COUNT(invoice_id) AS purchases
FROM
  luisalva.walmart_dataset.walmart_sales
GROUP BY
  city
ORDER BY
  purchases DESC;


---How many customers types does the data has?
SELECT
  DISTINCT customer_type
FROM
  luisalva.walmart_dataset.walmart_sales;


--- How many product lines does the data has?
SELECT
  DISTINCT product_line
FROM
  luisalva.walmart_dataset.walmart_sales;


--- Worst performing product lines by purchases made
SELECT
  product_line,
  COUNT(invoice_id) AS purchases
FROM
  luisalva.walmart_dataset.walmart_sales
GROUP BY
  product_line
ORDER BY
  purchases;


--- Worst performing product line by quantity of items purchase
SELECT
  product_line,
  SUM(quantity) AS quantity_purchased
FROM
  luisalva.walmart_dataset.walmart_sales
GROUP BY
  product_line
ORDER BY
  quantity_purchased;


--- Worst performing product line by gross income
SELECT
  product_line,
  ROUND(SUM(gross_income), 2) AS total_gross_income
FROM
  luisalva.walmart_dataset.walmart_sales
GROUP BY
  product_line
ORDER BY
  total_gross_income;
  

--- Worst performing product line by city
SELECT
  city,
  product_line,
  COUNT(invoice_id) AS purchases
FROM
  luisalva.walmart_dataset.walmart_sales
GROUP BY
  city,
  product_line
ORDER BY
  purchases


--- Worst performing product line by total money spent
SELECT
  product_line,
  ROUND(SUM(total), 2) AS total_spent
FROM
  luisalva.walmart_dataset.walmart_sales
GROUP BY
  product_line
ORDER BY
  total_spent;


--- Product line under the average product line total spent
WITH total_product_line as (SELECT product_line, ROUND(SUM(total), 2) AS total_spent
FROM luisalva.walmart_dataset.walmart_sales
GROUP BY product_line)

SELECT product_line, total_spent 
FROM total_product_line
WHERE total_spent < (SELECT AVG(total_spent)
               FROM total_product_line)
ORDER BY total_spent;

--- Total money spent month to month, Average money spent month to month, Count of purchases month to month
SELECT month, ROUND (SUM(total), 2) AS total_spent, ROUND (AVG(total), 2) AS average_count,  COUNT(total) AS purchase_count
FROM luisalva.walmart_dataset.walmart_sales
GROUP BY month;

--- Trend of total spent by each product line month to month 
--- Average spent by customer 
--- Average spent by costumer on each product line.




