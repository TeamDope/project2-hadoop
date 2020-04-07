echo "Creating partitioned sales and product table by month and year"
impala-shell -f project2-hadoop/sql/create_product_sales_partition.sql

