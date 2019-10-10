#!/bin/sh

for i in day pay first
do
	cat "${i}.dat" | kafka-avro-console-producer --topic "jch3.${i}.scenario"  --batch-size 16000 --broker-list localhost:9092  --property schema.registry.url=http://localhost:8081 --producer.config client.properties --property value.schema=`cat ${i}.avsc` --property parse.key=true --property key.separator='|' --property key.schema='{"type":"string"}'
done

