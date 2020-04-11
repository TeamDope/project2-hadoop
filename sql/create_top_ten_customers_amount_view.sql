--*************************************
--CREATE View Top Ten Customers Amount
--*************************************

SET VAR:database=dope_sales_raw;

CREATE VIEW IF NOT EXISTS ${var:database}.top_ten_customers_amount as 
Select c.customer_id,c.last_name,c.first_name,sum(s.quantity*p.price) as amount
FROM ${var:database}.customers c join ${var:database}.orders s on (c.customer_id = s.customer_id) join ${var:database}.products p on (s.product_id=p.product_id)
GROUP BY c.customer_id, c.last_name, c.first_name
ORDER BY amount DESC
LIMIT 10;

invalidate metadata;
compute stats ${var:database}.top_ten_customers_amount;
