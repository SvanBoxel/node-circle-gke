#!/bin/bash

if [ "$CIRCLE_BRANCH"=="master" ]; then
  echo "aaa"
  ENVIRONMENT="production"
else
  echo "bbb"

  ENVIRONMENT="qa"
fi

echo $CIRCLE_BRANCH
echo $ENVIRONMENT
curl -s -X "POST" "https://api.github.com/repos/SvanBoxel/node-circle-gke/deployments" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -H "Accept: application/vnd.github.ant-man-preview+json" \
     -d $'{
      "ref": "'"${CIRCLE_BRANCH}"'",
      "environment": "'"${ENVIRONMENT}"'" ,
      "required_contexts": []
    }' 
