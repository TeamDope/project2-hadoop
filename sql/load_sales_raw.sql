--*************************************
--CREATE EXTERNAL TABLES on Raw Sales Data
--*************************************

--command to run
--
--${var:database_name}
--Create Database

SET VAR:database_name=dope_sales_raw;

Create Database IF NOT EXISTS ${var:database_name}
COMMENT 'Raw sales data imported';


--Create External Orders Table
CREATE EXTERNAL TABLE IF NOT EXISTS ${var:database_name}.orders (
order_id int,
sales_person_id int,
customer_id int,
product_id int,
quantity int,
order_date varchar)
COMMENT 'sales orders table'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/salesdb/Sales2/'
TBLPROPERTIES ("skip.header.line.count"="1");



--Create External Products Table
CREATE EXTERNAL TABLE IF NOT EXISTS ${var:database_name}.products (
product_id int,
name varchar,
price float)
COMMENT 'sales products table'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/salesdb/Products/'
TBLPROPERTIES ("skip.header.line.count"="1");

--Create External Employees Table
CREATE EXTERNAL TABLE IF NOT EXISTS ${var:database_name}.employees (
employee_id int,
first_name varchar,
middle_initial varchar,
last_name varchar,
region varchar)
COMMENT 'sales employees table'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/salesdb/Employees2/'
TBLPROPERTIES ("skip.header.line.count"="1");

--Create External Customers Table
CREATE EXTERNAL TABLE IF NOT EXISTS ${var:database_name}.customers (
customer_id int,
first_name varchar,
middle_initial varchar,
last_name varchar)
COMMENT 'sales customers table'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/salesdb/Customers2/'
TBLPROPERTIES ("skip.header.line.count"="1");

invalidate metadata;
compute stats ${var:database_name}.orders;
compute stats ${var:database_name}.products;
compute stats ${var:database_name}.employees;
compute stats ${var:database_name}.customers;
