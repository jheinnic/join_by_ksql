#!/bin/sh

for i in day pay first
do
	kafka-topics --bootstrap-server localhost:9092 --delete --topic "jch3.${i}.scenario"
	kafka-topics --bootstrap-server localhost:9092 --create --topic "jch3.${i}.scenario" --partitions 1 --replication-factor 1 --config retention.ms=-1 --config retention.bytes=-1
	cat "${i}.dat" | kafka-avro-console-producer --topic "jch3.${i}.scenario"  --batch-size 16000 --broker-list localhost:9092  --property schema.registry.url=http://localhost:8081 --producer.config client.properties --property value.schema=`cat ${i}.avsc` --property parse.key=true --property key.separator='|' --property key.schema='{"type":"string"}'
done

for i in FIRST2 DAY2 all_day_joins next_day_joins day_one_joins all_day_joins_2 day_all_joins_2 recurse_day_joins
do
	kafka-topics --bootstrap-server localhost:9092 --delete --topic "${i}"
	kafka-topics --bootstrap-server localhost:9092 --create --topic "${i}" --partitions 1 --replication-factor 1 --config retention.ms=-1 --config retention.bytes=-1
done

