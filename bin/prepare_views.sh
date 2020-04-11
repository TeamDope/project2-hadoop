echo "Deliverable 2 Step 2 #4a: Creating view based on monthly sales data with customers"
impala-shell -f sql/create_monthly_sales_view.sql

echo "Deliverable 2 Step 2 #4b: Creating view based on top 10 customers and their lifetime purchased amount"
impala-shell -f sql/create_top_ten_customers_amount_view.sql
