#!/bin/sh
set -e

docker compose -p "${NAMESPACE:-zilla-http-kafka-cache}" down --remove-orphans
