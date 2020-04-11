SET VAR:database_name=dope_sales;
--View: customer_monthly_sales_2019_partitioned_view
--Customer id, customer last name, customer first name,
--year, month, aggregate total amount
--of all products purchased by month for 2019.

CREATE VIEW IF NOT EXISTS ${VAR:database_name}.customer_monthly_sales_2019_partitioned_view 
as 
SELECT c.customer_id, c.last_name, c.first_name, ps.sales_year, ps.sales_month, sum(ps.total_sales_amount) as agg_amount FROM ${VAR:database_name}.product_sales_partition ps JOIN ${VAR:database_name}.customers c ON (ps.customer_id = c.customer_id) WHERE ps.sales_year = '2019' GROUP BY c.customer_id, c.last_name, c.first_name, ps.sales_year, ps.sales_month;

