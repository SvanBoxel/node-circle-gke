#!/bin/bash

if [[ $CIRCLE_BRANCH=="master" ]]; then
  ENVIRONMENT="production"
else
  ENVIRONMENT="QA"
fi

curl -s -X "POST" "https://api.github.com/repos/SvanBoxel/node-circle-gke/deployments" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
<<<<<<< Updated upstream
  "ref": "'"${CIRCLE_BRANCH}"'",
  "environment": "'"${ENVIRONMENT}"'" 
  "required_contexts": []
}' | jq -r '.id' > deployment_id
