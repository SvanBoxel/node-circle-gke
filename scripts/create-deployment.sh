#!/bin/bash
echo $GITHUB_TOKEN
curl -X "POST" "https://api.github.com/repos/SvanBoxel/node-circle-gke/deployments" \
     -H 'Authorization: token $GITHUB_TOKEN' \
     -H 'Content-Type: text/plain; charset=utf-8' \
     -d $'{
  "ref": "master"
}'
