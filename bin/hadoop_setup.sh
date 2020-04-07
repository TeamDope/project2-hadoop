echo creating hdfs directory salesdb
sudo -u hdfs hdfs dfs -mkdir /salesdb
  
for file in sales/salesdb/*
   do
     echo processing "$file"
     filename=$(basename -- "$file")
     echo creating hdfs directory: salesdb/"${filename%.*}"
     sudo -u hdfs hdfs dfs -mkdir /salesdb/"${filename%.*}"
     echo puting file sales/salesdb/$filename to hdfs directory: salesdb/"${filename%.*}"
     echo files in this directory are-
     ls sales/salesdb
     sudo -u hdfs hdfs dfs -put sales/salesdb/$filename /salesdb/"${filename%.*}"/

#     echo "$filename"

   done
   echo Changing owner of hdfs directory to hive
   sudo -u hdfs hadoop fs -chown -R hive:hive /salesdb
