--*************************************
--CREATE MATERIALIZED TABLES on Sales Data
--*************************************

--command to run
--
--${var:database_name}
--Create Database

SET VAR:database_name=dope_sales_raw;

Create Database IF NOT EXISTS ${VAR:database_name}
COMMENT 'sales data';



CREATE TABLE IF NOT EXISTS ${VAR:database_name}.denormalized_sales_products_table
AS SELECT o.*, p.name, p.price FROM ${VAR:database_name}.orders o JOIN ${VAR:database_name}.products p on (o.product_id = p.product_id);


CREATE TABLE IF NOT EXISTS ${VAR:database_name}.product_sales_partition PARTITIONED BY (sales_year, sales_month)
COMMENT 'Parquet sales table partitioned by year and month'
STORED AS Parquet
AS SELECT order_id, sales_person_id, customer_id, product_id, name, price, quantity, price * quantity AS total_sales_amount, order_date, regexp_extract(order_date, '([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1]) (2[0-3]|[01][0-9]):[0-5][0-9]', 1) AS sales_year, regexp_extract(order_date, '([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1]) (2[0-3]|[01][0-9]):[0-5][0-9]', 2) AS sales_month FROM ${VAR:database_name}.denormalized_sales_products_table; 


