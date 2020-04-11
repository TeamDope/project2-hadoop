--*************************************
--CREATE MATERIALIZED TABLES on Sales Data
--*************************************

--command to run
--
--${var:database_name}
--Create Database

SET VAR:database_name=dope_sales;

Create Database IF NOT EXISTS ${VAR:database_name}
COMMENT 'sales data';



CREATE TABLE IF NOT EXISTS ${VAR:database_name}.denormalized_sales_products_table
AS SELECT o.*, p.name, p.price FROM ${VAR:database_name}.orders o JOIN ${VAR:database_name}.products p on (o.product_id = p.product_id);


CREATE TABLE IF NOT EXISTS ${VAR:database_name}.product_sales_partition PARTITIONED BY (sales_year, sales_month)
COMMENT 'Parquet sales table partitioned by year and month'
STORED AS Parquet
AS SELECT order_id, sales_person_id, customer_id, product_id, name, price, quantity, price * quantity AS total_sales_amount, order_date, year(order_date) AS sales_year, month(order_date) AS sales_month FROM ${VAR:database_name}.denormalized_sales_products_table; 


