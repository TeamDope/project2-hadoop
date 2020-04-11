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
SELECT e.employee_id, e.first_name, e.middle_initial, e.last_name, UPPER(e.region) 
from ${var:source_database}.employees;
