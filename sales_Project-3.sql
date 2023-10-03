-- total no. of records in transaction table where sales is a schema name:
SELECT * FROM sales.transactions;
SELECT count(*) FROM sales.transactions; -- 150283
-- records in customers table
SELECT count(*) FROM sales.customers; -- 38
-- Give me all records from transation table where market_code is 'Mark001':
SELECT * FROM sales.transactions where market_code = 'Mark001';
/* do count of it: */
SELECT count(*) FROM sales.transactions where market_code = 'Mark001'; -- 1035

-- create a table by joining transaction and date table
SELECT sales.transactions.*, sales.date.* FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date;
-- show the records only for year 2020
SELECT sales.transactions.*, sales.date.* FROM sales.transactions INNER JOIN sales.date ON 
sales.transactions.order_date = sales.date.date where sales.date.year=2020;

-- total sales amount for year 2020
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON 
sales.transactions.order_date = sales.date.date where sales.date.year=2020;  -- 142235559

-- total sales amount for year 2019
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON 
sales.transactions.order_date = sales.date.date where sales.date.year=2019; -- 336452114

--  total sales amount for year 2020 and also for chennai , so chennai market code = 'Mark001'
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON 
sales.transactions.order_date = sales.date.date where sales.date.year = 2020 and sales.transactions.market_code = 'Mark001'; -- 2463024

-- distinct product from transactions table
SELECT distinct(product_code) FROM sales.transactions;
