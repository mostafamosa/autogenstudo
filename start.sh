#!/bin/bash
# Set default values if not provided
DOMAIN=${DOMAIN:-"defaultdomain.com"}
GRAPHQL_PATH=${GRAPHQL_PATH:-"/v1/gql"}
GRAPHQL_ENDPOINT="https://${DOMAIN}${GRAPHQL_PATH}"

# Export for application use
export GRAPHQL_ENDPOINT

# Start your application
autogenstudio ui --port 8081
