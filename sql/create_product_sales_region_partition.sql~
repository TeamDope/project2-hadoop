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



CREATE TABLE IF NOT EXISTS ${VAR:database_name}.denormalized_sales_products_region_table
AS SELECT po.*, e.region FROM ${VAR:database_name}.product_sales_partition po JOIN ${VAR:database_name}.employees e on (po.sales_person_id = e.employee_id);


CREATE TABLE IF NOT EXISTS ${VAR:database_name}.product_sales_region_partition PARTITIONED BY (sales_year, sales_month, region)
COMMENT 'Parquet sales table partitioned by year, month, and region'
STORED AS Parquet
AS SELECT order_id, sales_person_id, customer_id, product_id, name, price, quantity, price * quantity AS total_sales_amount, order_date, sales_year, sales_month, region FROM ${VAR:database_name}.denormalized_sales_products_region_table; 


