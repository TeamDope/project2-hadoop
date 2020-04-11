echo "Dropping parquet database and tables"
impala-shell -q "DROP DATABASE IF EXISTS dope_sales CASCADE;"
