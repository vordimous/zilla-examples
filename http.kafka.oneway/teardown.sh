#!/bin/sh
set -e

docker compose -p "${NAMESPACE:-zilla-http-kafka-oneway}" down --remove-orphans
