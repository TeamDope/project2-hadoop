echo "Deliverable 3 #1: Creating partitioned sales and product table by month and year"
impala-shell -f sql/create_product_sales_partition.sql

echo "Deliverable 3 #2: Creating view based on partitioned sales and product table by month and year (Referring to Deliverable 2 Step 2 #4a)"
impala-shell -f sql/create_monthly_sales_partitioned_view.sql

echo "Deliverable 3 #3: Creating partitioned sales and product table by month, year, and region"
impala-shell -f sql/create_product_sales_region_partition.sql
