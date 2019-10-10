#!/bin/sh

topic=$1

partition=$2
if [[ ! -n $partition ]]
then
        partition=all
fi

if [[ "zall" != "z${partition}" ]]
then
	kafka-avro-console-consumer \
		--bootstrap-server http://localhost:9092 \
		--consumer.config client.properties \
		--property schema.registry.url=http://localhost:8081 \
		--property print.key=true \
		--property print.value=true \
		--property print.timestamp=true \
		--partition ${partition} \
		--topic ${topic} \
		--from-beginning
else
	echo "all"
	kafka-avro-console-consumer \
		--bootstrap-server http://localhost:9092 \
		--consumer.config client.properties \
		--property schema.registry.url=http://localhost:8081 \
		--property print.key=true \
		--property print.value=true \
		--property print.timestamp=true \
		--topic ${topic} \
		--from-beginning
fi
