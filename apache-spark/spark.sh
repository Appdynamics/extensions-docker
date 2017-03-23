#!/usr/bin/env bash

SPARK_HOME=/usr/local/spark

. "${SPARK_HOME}/sbin/spark-config.sh"
. "${SPARK_HOME}/bin/load-spark-env.sh"
if [ -z "$SLAVE" ]; then
    ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master -h `hostname`
else
    ${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker  -h `hostname` spark://spark.master:7077
fi
