# For deliverable 3.4
echo "Removing data from hdfs"
sudo -u hdfs hdfs dfs -rm -r /salesdb

echo "Removing tar and folders"
rm -r sales/
rm salesdata.tar.gz
