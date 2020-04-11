--************************************
--CREATE Parquet TABLES on Sales Data
--************************************

SET VAR:database=dope_sales;

SET VAR:source_database=dope_sales_raw;

Create Database IF NOT EXISTS ${var:database}
COMMENT 'Parquet sales data imported from sales database';

--Create Parquet Employees Table

CREATE TABLE IF NOT EXISTS ${var:database}.employees
COMMENT 'Parquet employees table'
STORED AS Parquet
AS
SELECT employee_id, first_name, middle_initial, last_name, UPPER(region) 
from ${var:source_database}.employees;


--Create Parquet Customers Table

CREATE TABLE IF NOT EXISTS ${var:database}.customers
COMMENT 'Parquet customers table'
STORED AS Parquet
AS
SELECT cutomer_id, first_name, middle_initial, last_name
from ${var:source_database}.customers;


--Create Parquet Orders Table

CREATE TABLE IF NOT EXISTS ${var:database}.orders
COMMENT 'Parquet orders table'
STORED AS Parquet
AS
SELECT order_id, sales_person_id, customer_id, product_id, quantity, order_date
from ${var:source_database}.orders;


--CREATE Parquet Products Tables

CREATE TABLE IF NOT EXISTS ${var:database}.products
COMMENT 'PARQUET products table'
STORED AS Parquet
AS
SELECT product_id, name, price
from ${var:source_database}.products;
