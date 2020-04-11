all: deliverable-2 deliverable-3

deliverable-2:
	sh bin/get_data.sh
	sh bin/hadoop_setup.sh
	sh bin/load_raw.sh
	sh bin/create_parquet_tables.sh
	sh bin/prepare_views.sh

deliverable-3:
	sh bin/prepare_partitions.sh

clean:
	sh bin/drop_views.sh
	sh bin/drop_parquet_database.sh
	sh bin/drop_raw_database.sh
	sh bin/delete_hdfs_raw.sh
