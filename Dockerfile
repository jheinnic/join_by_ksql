FROM confluentinc/cp-ksql-server:5.3.1

RUN mkdir -p /etc/kafka-ksql
COPY ksql_issue_demo.ksql /etc/kafka-ksql
