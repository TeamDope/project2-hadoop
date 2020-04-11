# project2-hadoop
## Team Information
**Name:** dope  
**Slack Channel:** dope  
**Members:**  
* Cody Perakslis
* Ansh Sikka
* Yikun Qian

## Deployment RunBook
1. Clone the directory from GitHub: `git clone https://github.com/TeamDope/project2-hadoop.git`
2. CD into the cloned directory: `cd project2-hadoop`
3. To Run All Deliverables, simply type  `make all`
4. To Run Deliverable 2, simply type `make deliverable-2`
5. To Run Deliverable 3, simply type  `make deliverable-3`
6. To delete all data and tables/clean up, simply type `make clean`

## User Documentation
### Data
- Employees
  - first_name
  - middle_initial 
  - employee_id
  - region
- Products
  - product_id
  - name
  - price
- Orders
  - order_id
  - sales_person_id
  - customer_id
  - product_id
  - quantity
  - date
- Customers
  - customer_id
  - first_name
  - middle_initial
  - last_name
## Tables and Views
- dope_sales_raw
  - employees: Raw Employees Table
  - products: Raw Products Table
  - orders: Raw Orders Table
  - customers: Raw Customers Table
- dope_sales
  - employees: Cleaned Employees Table
  - products: Cleaned Products Table
  - orders: Cleaned Orders Table
  - customers: Cleaned Customers Table
  - customer_monthly_sales_2019_partitioned_view: Sales by month in 2019--> Based on partition by month and year
  - customer_monthly_sales_2019_view: Sales by month in 2019 from regular data
  - denormalized_sales_product_table: Product and sales data combined (includes all order data with price and product id)
  - product_sales_partition: Partitioned table by month and year for all sales for each product
  - product_sales_region_partition: Partitioned table by month, year, and region for all sales for each product
  - denormalized_sales_products_region_table: Product, sales, and employee data compbined (includes all order data with price of product and region based on salesperson id)
  - top_ten_customers_amount: The total amount of sales for the top ten customers
## Issues/Challanges
### 1. Issues with raw data:
- 48 prices=0 in products
- Duplicate customerid in customers (customerid=17829 appears twice)
- Some regions are uppercase, some are lowercase.
### 2. Issues with Data Pipeline
The VM might need to be scaled up to a higher memory amount (>8gb) to get a more consistent flow in loading data and not running into memory issues. This specifically happens in Deliverable 3 Part 1-3 when the data is joined (denormalized) between the sales, products, and employees table. During denormalization, the memory can become overloaded, causing it to prematurely stop loading data. Afterwards, building the partitions off this data would not properly work since the data isn't properly loaded. 
### 3. Challanges
- Hadoop NameNode being down --> having to consistently restart Cloudera services (unstable on VM)
- Permission when running some bash scripts --> Had to manually change it or call a different command
- Yikun only had 8gb of RAM on her computer which made it hard for her to properly run the VM on her machine. Being able to not work in-person together made this pretty tough.
## Deliverable 3

**2. Performance on the view Using Partitioned Data vs. Performance on View Using Non-Partitioned Data
Performance was tested on a virtual machine with 8GB of RAM and 2 CPU's Running on Intel i5 Architecture.**

-Time Taken to Load View on Non-Partitioned Tables: 4.38s
-Time Taken to Load View on Partitioned Table: 3.11s

*The answer below is what it would be like if it was scaled to a production environment.*

The reason that the view based on the partitioned table would be faster is due to the fact that the partitioned table is partitioned by month and year. Since our query for the view involved grouping by month and year, the locality is greatly improved to the point where the system can grab a chunk of data containing data from each sale for each month (organized by month) and feed it into the view from the partitioned table. Since the data is partitioned by year too, it can stop retrieving data once it hit the last record with a sales_year of 2019. Unfortunately on the other hand, the view where the data isn't partitioned loads slightly slower due to the fact that it might have to do a full table scan (in it's worst case) to retrieve each correct recrod based on both month and year. This can have significant scaling impacts if the data is extremely large.

In terms of data visualization, I think it really depends on the question the visualization is answering. If it is more about aggregations and displaying record data in ranges, the view based on the partitioned table will perform better due to locality in calculations and access. However, if data is randomly accessed around the table, partitioning will have no affect since most of this will involve a full table scan. This doesn't happen as often with visualizations but it is a point to consider.
