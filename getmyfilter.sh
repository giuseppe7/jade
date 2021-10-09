#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source ${SCRIPT_DIR}/common.sh

if [[ -z "$1" ]]; then
  echo "Usage: ${BASH_SOURCE[0]} [filterId]"
  exit 1
fi

curl -s -X GET \
  -H "Authorization: Basic ${BASIC_AUTH}" \
  -H "Content-Type: application/json" \
  "https://${API_DOMAIN}.atlassian.net/rest/api/2/filter/$1" \
  | jq '. | {id:.id, name:.name, jql:.jql}'