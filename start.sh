#!/bin/bash
# Set default values if not provided
DOMAIN=${{shared.DOMAIN}}
GRAPHQL_PATH=${GRAPHQL_PATH:-"/v1/gql"}
GRAPHQL_ENDPOINT="https://${DOMAIN}${GRAPHQL_PATH}"

# Export for application use
export GRAPHQL_ENDPOINT

# Start your application
autogenstudio ui --port 8081
