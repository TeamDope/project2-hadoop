echo "Deliverable 3 #1: Creating partitioned sales and product table by month and year"
impala-shell -f project2-hadoop/sql/create_product_sales_partition.sql

echo "Deliverable 3 #2: Creating partitioned sales and product table by month, year, and region"
impala-shell -f project2-hadoop/sql/create_product_sales_region_partition.sql
