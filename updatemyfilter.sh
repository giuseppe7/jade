#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source ${SCRIPT_DIR}/common.sh

if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
  echo "Usage: ${BASH_SOURCE[0]} [filterId] [name] [jql]"
  exit 1
fi

curl -s -X PUT \
  -H "Authorization: Basic ${BASIC_AUTH}" \
  -H "Content-Type: application/json" \
  -d "{ \"jql\": \"${3}\", \"name\": \"${2}\" }" \
  "https://${API_DOMAIN}.atlassian.net/rest/api/2/filter/$1" \
  | jq '. | {id:.id, name:.name, jql:.jql}'