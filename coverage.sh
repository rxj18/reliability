#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "Usage: ./coverage <commit-sha>"
  exit 1
fi

sha="$1"
dir="${2:-$PWD}"

run_id=$(gh run list \
  --repo razorpay/payments-nb-wallet \
  --workflow CI \
  --commit "$sha" \
  --limit 1 \
  --json databaseId \
  --jq '.[0].databaseId')

if [[ -z "$run_id" ]]; then
  echo "No CI run found for commit: $sha"
  exit 1
fi

echo "Found run ID: $run_id"

gh run download "$run_id" \
  --repo razorpay/payments-nb-wallet \
  -n coverage \
  -D "$dir"

echo "Coverage file: $dir/sonarqube.cov"
