#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source ${SCRIPT_DIR}/common.sh

if [[ -z "$1" ]]; then
  echo "Usage: ${BASH_SOURCE[0]} [accountId]"
  exit 1
fi

curl -s -X GET \
  -H "Authorization: Basic ${BASIC_AUTH}" \
  -H "Content-Type: application/json" \
  "https://${API_DOMAIN}.atlassian.net/rest/api/2/user?accountId=$1" \
  | jq -c '. | {accountId: .accountId, emailAddress: .emailAddress, displayName: .displayName}'