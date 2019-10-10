#!/bin/sh

topic=$1

partition=$2
if [[ ! -n $partition ]]
then
        partition=all
fi

if [[ "zall" != "z${partition}" ]]
then
	kafka-console-consumer \
		--bootstrap-server http://localhost:9092 \
		--consumer.config client.properties \
		--topic ${topic} \
		--property print.key=true \
		--property print.value=true \
		--property print.timestamp=true \
		--from-beginning \
		--partition ${partition}
else
	kafka-console-consumer \
		--bootstrap-server http://localhost:9092 \
		--consumer.config client.properties \
		--topic ${topic} \
		--property print.key=true \
		--property print.value=true \
		--property print.timestamp=true \
		--from-beginning 
fi
