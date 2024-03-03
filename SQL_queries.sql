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
