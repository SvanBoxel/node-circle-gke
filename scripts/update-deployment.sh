#!/bin/bash

DEPLOYMENT_ID=`cat deployment_id`
CLUSTER_IP=`cat cluster-ip`
ENVIRONMENT_URL="http://${CLUSTER_IP}/"

curl -X "POST" "https://api.github.com/repos/SvanBoxel/node-circle-gke/deployments/${DEPLOYMENT_ID}/statuses" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -H 'Accept: application/vnd.github.ant-man-preview+json' \
     -d $'{
  "environment_url": "'"${ENVIRONMENT_URL}"'",
  "state": "success"
}'
