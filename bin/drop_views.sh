echo "Dropping views"
impala-shell -q "DROP VIEW IF EXISTS dope_sales.customer_monthly_sales_2019_view;"
impala-shell -q "DROP VIEW IF EXISTS dope_sales.top_ten_customers_amount;"
impala-shell -q "DROP VIEW IF EXISTS dope_sales.customer_monthly_sales_2019_partitioned_view;"
