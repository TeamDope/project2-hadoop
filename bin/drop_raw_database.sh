echo "Dropping raw database and tables"
impala-shell -q "DROP DATABASE IF EXISTS dope_sales_raw CASCADE;"
