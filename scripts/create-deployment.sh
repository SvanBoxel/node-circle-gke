#!/bin/bash

curl -s -X "POST" "https://api.github.com/repos/SvanBoxel/node-circle-gke/deployments" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "ref": "master",
  "required_contexts": []
}' | jq -r '.id' > deployment_id
