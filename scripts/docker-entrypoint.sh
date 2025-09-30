#!/bin/sh

# Solution to permissions error when running wait-for-it-es.sh
# Adapted from https://stackoverflow.com/questions/63198731/how-to-use-wait-for-it-in-docker-compose-filed

# Abort on any error (including if wait-for-it fails).
set -e

# Wait for the backend to be up, if we know where it is.
if [ -n "$ES_HOST" ]; then
  /app/scripts/wait-for-it-es.sh "$ES_HOST:${ES_PORT:-9200}"
fi

# Run the main container command.
exec "$@"
