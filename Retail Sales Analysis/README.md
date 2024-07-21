# Walmart Sales Analysis

This project aims to explore Walmart sales data to understand top-performing branches and products, sales trends of different products, and customer behavior. The goal is to study how sales strategies can be improved and optimized. 

# Purpose of the Project

The primary aim of this project is to gain insight into Walmart's sales data to understand the various factors that affect sales across different branches.

# Data
The dataset contains sales transactions from three different branches of Walmart, located in Mandalay, Yangon, and Naypyitaw. The data consists of 17 columns and 1,000 rows.

Here's the information converted into a table format:

| Column                  | Description                          | Data Type        |
|-------------------------|-----------------------------------------|------------------|
| invoice_id              | Invoice of the sales made               | VARCHAR(30)      |
| branch                  | Branch at which sales were made         | VARCHAR(5)       |
| city                    | The location of the branch              | VARCHAR(30)      |
| customer_type           | The type of the customer                | VARCHAR(30)      |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)      |
| product_line            | Product line of the product sold        | VARCHAR(100)     |
| unit_price              | The price of each product               | DECIMAL(10, 2)   |
| quantity                | The amount of the product sold          | INT              |
| VAT                     | The amount of tax on the purchase       | FLOAT(6, 4)      |
| total                   | The total cost of the purchase          | DECIMAL(10, 2)   |
| date                    | The date on which the purchase was made | DATE             |
| time                    | The time at which the purchase was made | TIMESTAMP        |
| payment_method          | The payment method used              | VARCHAR(30)         |
| cogs                    | Cost of Goods Sold                   | DECIMAL(10, 2)      |
| gross_margin_percentage | Gross margin percentage              | FLOAT(11, 9)        |
| gross_income            | Gross Income                         | DECIMAL(10, 2)      |
| rating                  | Rating                               | FLOAT(2, 1)         |

# Analysis
1. Product Analysis:   Conducted an analysis of the data to understand the different product lines, identify the product lines performing best, and determine the product lines that need                           improvement.
2. Sales Analysis:     This analysis aims to answer the question of sales trends for each product. The results can help us measure the effectiveness of each sales strategy the business 
                       applies and determine what modifications are needed to increase sales.
3. Customer Analysis:  This analysis aims to uncover the different customer segments, purchase trends, and the profitability of each customer segment.

# Approach

1. Data Wrangling:
- Inspected data to detect NULL values and missing values.
- Replace missing or NULL values.

2. Building a Database:
- Create tables to store the data.

3. Feature Engineering:
- Generate new columns from existing ones to provide additional insights.
  - `time_of_day`: Categorize sales into Morning, Afternoon, or Evening.
  - `day_name`: Extract the day of the week (Mon, Tue, etc.) from transaction dates.
  - `month_name`: Extract the month of the year (Jan, Feb, etc.) from transaction dates.

4. Exploratory Data Analysis (EDA):
- Performed analysis to address the following using SQL queries:
     - Which part of the day sees the most sales?
     - Which day of the week is each branch busiest?
     - Which month of the year has the highest sales and profit?

## Analysis Questions
### Generic
- Count of unique cities in the dataset.
- City location for each branch.

### Product
- Number of unique product lines.
- Most frequently used payment method.
- Top-selling product line.
- Total revenue breakdown by month.
- Month with the highest Cost of Goods Sold (COGS).
- Product line with the highest revenue.
- City generating the highest revenue.
- Product line associated with the highest VAT.
- Classification of each product line as "Good" or "Bad" based on sales.
- Branches with sales exceeding the average number of products sold.
- Most popular product line by gender.
- Average rating for each product line.


### Sales
- Number of sales at different times of the day per weekday.
- Customer type contributing the most revenue.
- City with the highest VAT percentage.
- Customer type making the highest VAT payments.

### Customer
- Count of unique customer types.
- Number of unique payment methods.
- Most common customer type.
- Customer type with the highest purchase volume.
- Predominant gender among customers.
- Gender distribution across branches.
- Time of day with the highest volume of customer ratings.
- Peak rating time per branch.
- Day of the week with the highest average ratings.
- Best-rated day per branch.

## Conclusion:

The sales data analysis for Walmart’s Mandalay, Yangon, and Naypyitaw branches provides essential insights into product performance, sales trends, and customer behaviors. By exploring different cities, product lines, and customer segments, I identified best-selling products, peak sales times, and effective payment methods, which help in refining sales strategies, improving customer engagement, and financial growth.


