#!/bin/bash

DEPLOYMENT_ID=`cat deployment_id`

if [ "$CIRCLE_BRANCH" = "master" ] 
then
  ENVIRONMENT_URL="http://35.225.249.226/"
else
  ENVIRONMENT_URL="https://35.225.196.189/"
fi

curl -X "POST" "https://api.github.com/repos/SvanBoxel/node-circle-gke/deployments/${DEPLOYMENT_ID}/statuses" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -H 'Accept: application/vnd.github.ant-man-preview+json' \
     -d $'{
  "environment_url": "'"${ENVIRONMENT_URL}"'",
  "state": "success"
}'
