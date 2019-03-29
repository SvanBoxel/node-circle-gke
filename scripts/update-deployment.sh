#!/bin/bash

DEPLOYMENT_ID=`cat deployment_id`

curl -X "POST" "https://api.github.com/repos/SvanBoxel/node-circle-gke/deployments/${DEPLOYMENT_ID}/statuses" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "state": "success"
}'
