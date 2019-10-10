#!/bin/sh

for i in FIRST2 DAY2 all_day_joins next_day_joins day_one_joins all_day_joins_2 day_all_joins_2 recurse_day_joins
do
	kafka-topics --bootstrap-server localhost:9092 --delete --topic "${i}"
	kafka-topics --bootstrap-server localhost:9092 --create --topic "${i}" --partitions 1 --replication-factor 1 --config retention.ms=-1 --config retention.bytes=-1
done

