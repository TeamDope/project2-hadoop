# project2-hadoop
## Team Information
**Name:** dope  
**Slack Channel:** dope  
**Members:**  
* Cody Perakslis
* Ansh Sikka
* Yikun Qian

## Deliverable 2
### 1. Issues with raw data:
- 48 prices=0 in products
- Duplicate customerid in customers (customerid=17829 appears twice)
## Deliverable 3

**2. Performance on the view Using Partitioned Data vs. Performance on View Using Non-Partitioned Data
Performance was tested on a virtual machine with 8GB of RAM and 2 CPU's Running on Intel i5 Architecture

-Time Taken to Load View on Non-Partitioned Tables: 4.38s
-Time Taken to Load View on Partitioned Table: 3.11s

The reason that the view based on the partitioned table would be faster is due to the fact that the partitioned table is partitioned by month and year. Since our query for the view involved grouping by month and year, the locality is greatly improved to the point where the system can grab a chunk of data containing data from each sale for each month (organized by month) and feed it into the view from the partitioned table. Since the data is partitioned by year too, it can stop retrieving data once it hit the last record with a sales_year of 2019. Unfortunately on the other hand, the view where the data isn't partitioned loads slightly slower due to the fact that it might have to do a full table scan (in it's worst case) to retrieve each correct recrod based on both month and year. This can have significant scaling impacts if the data is extremely large.

In terms of data visualization, I think it really depends on the question the visualization is answering. If it is more about aggregations and displaying record data in ranges, the view based on the partitioned table will perform better due to locality in calculations and access. However, if data is randomly accessed around the table, partitioning will have no affect since most of this will involve a full table scan. This doesn't happen as often with visualizations but it is a point to consider.
