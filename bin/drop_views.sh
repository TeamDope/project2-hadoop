echo "Dropping views"
impala-shell -q "DROP VIEW IF EXISTS dope_sales_raw.customer_montly_sales_2019_view;"
impala-shell -q "DROP VIEW IF EXISTS dope_sales_raw.top_ten_customers_amount;"
