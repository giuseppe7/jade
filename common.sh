#!/bin/bash
if ! command -v base64 &> /dev/null; then
  echo "Scripts use base64, please install it before continuing."
  exit 1
fi

if ! command -v jq &> /dev/null; then
  echo "Scripts use jq, please install it before continuing."
  exit 1
fi

if [[ -z "${API_DOMAIN}" ]]; then
  echo "API_DOMAIN for Jira should be set before continuing. Used as API_DOMAIN.atlassian.net in API calls."
  exit 1
fi

if [[ -z "${API_TOKEN}" ]]; then
  echo "API_TOKEN for Jira should be set before continuing."
  exit 1
fi

if [[ -z "${API_UNAME}" ]]; then
  echo "API_UNAME for Jira should be set before continuing."
  exit 1
fi

BASIC_AUTH=$(echo -n ${API_UNAME}:${API_TOKEN} | base64)


