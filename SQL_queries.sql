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

-------------- Create day_name column
ALTER TABLE luisalva.walmart_dataset.walmart_sales 
	ADD COLUMN day_name STRING;

UPDATE
  luisalva.walmart_dataset.walmart_sales
SET
  day_name = format_date('%A', date)
WHERE
  day_name IS NULL;



