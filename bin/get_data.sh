echo "creating sales directory"
mkdir sales
echo "getting data from https://csci5751-2020sp.s3-us-west-2.amazonaws.com/sales-data/salesdata.tar.gz"
wget https://csci5751-2020sp.s3-us-west-2.amazonaws.com/sales-data/salesdata.tar.gz
echo "unzipping sales data"
tar -xvzf salesdata.tar.gz
mv salesdb sales
