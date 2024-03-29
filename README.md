# Walmart Customer Behavior Analysis

Create more complex queries that would give us better insights.
There are too many simple group by

## Purposes Of The Project

The aim of the project is to gain insight into the sales data of Walmart to understand customer behavior. This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment.
 

## About Data

The dataset was obtained from the (https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting).
This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method                 | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |



## Approach Used

1. **Data Wrangling:** This is the first step where inspection of data is done to make sure **NULL** values and missing values are detected and data replacement methods are used to replace, missing or **NULL** values.

> * Build a database
> * Create table and insert the data.
> * Select columns with null values in them. There are no null values in our database as in creating the tables, we set **NOT NULL** for each field, hence null values are filtered out.

2. **Feature Engineering:** This will help use generate some new columns from existing ones.

> * Add a new column named `time_of_day` to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.

> * Add a new column named `day_name` that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

> * Add a new column named `month_name` that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

## Customer Exploratory Analysis

Exploratory data analysis is done to answer the listed questions and aims of this project.

1. How many unique customers does the data set have?
2. How many unique customer types does the data set have?
3. What is the most common customer type?
4. What is the most common payment method?
5. What is the most selling product line?
6. What is the most selling product line by gender?
7. What product line had the largest revenue?
8. Which customer type buys the most?
9. Which customer type produces the largest revenue?
10. Which customer type pays the most in VAT?
11. What product line had the largest VAT?
12. Which of the customer types brings the most revenue?
13. What is the gender of most of the customers?
14. What is the most common product line by gender?
15. How many unique cities does the data have?
16. What is the gender distribution per city?
17. How many unique product lines does the data have?
18. Which time of the day do customers give most ratings?
19. Which day fo the week has the best avg ratings?
20. What is the average rating of each product line?
21. Number of sales made in each time of the day per weekday
22. Which branch sold more products than average product sold?
23. Quantiy sold by gender?


 How many unique customers does the data set have?
 How many customers per city?
 How many unique customer types does the data set have?
 What is the most common customer type?
 What is the most common payment method?
 Which customer type buys the most?
 Which customer type produces the largest revenue?
 What is the most selling product line?
 What is the most selling product line by gender?
 What is the product line where women spend the most money?
 What is the product line where men spend the most money?
 What is the gender that spends the most money?
 What is the customer type that spends the most money?
 What is the product line that makes the most money?
 What does normal/member customer spend ost oney on? What product line?
 


   


