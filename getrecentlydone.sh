#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source ${SCRIPT_DIR}/common.sh

if [[ -z "$1" ]] || [[ -z "$2" ]]; then
  echo "Usage: ${BASH_SOURCE[0]} [project] [accountId]"
  exit 1
fi

data="{ \"jql\": \"project=$1 and status=Done and resolutiondate >= -1w and assignee=$2\", \"maxResults\": 10, \"fields\":[\"summary\",\"status\",\"assignee\",\"resolution\"] }"

curl -s -X POST \
  -H "Authorization: Basic ${BASIC_AUTH}" \
  -H "Content-Type: application/json" \
  --data "${data}" \
  "https://${API_DOMAIN}.atlassian.net/rest/api/2/search" \
  | jq '.total'

#  | jq -c '.issues[] | {key:.key, summary:.fields.summary, status:.fields.status.name, resolution:.fields.resolution.name}'
