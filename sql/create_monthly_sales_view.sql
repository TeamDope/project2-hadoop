--*************************************
--CREATE Views
--*************************************


SET VAR:database_name=dope_sales_raw;
--View: customer_monthly_sales_2019_view
--Customer id, customer last name, customer first name,
--year, month, aggregate total amount
--of all products purchased by month for 2019.


CREATE VIEW IF NOT EXISTS ${var:database_name}.customer_monthly_sales_2019_view as

Select c.customer_id,c.last_name,c.first_name, year(s.order_date) as year, month(s.order_date) as month,sum(s.quantity) over (partition by month(s.order_date) ) as agg_amount
From ${var:database_name}.customers c join ${var:database_name}.orders s on (c.customer_id = s.customer_id) where year(s.order_date)=2019 


