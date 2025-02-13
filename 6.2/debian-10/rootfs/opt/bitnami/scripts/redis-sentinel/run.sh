#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose

# Load Redis Sentinel environment variables
. /opt/bitnami/scripts/redis-sentinel-env.sh

# Load libraries
. /opt/bitnami/scripts/libredissentinel.sh
. /opt/bitnami/scripts/liblog.sh
. /opt/bitnami/scripts/libos.sh

args=("$REDIS_SENTINEL_CONF_FILE" "--daemonize" "no" "$@")

info "** Starting Redis Sentinel **"
# We don't need this check
#if am_i_root; then
#    exec gosu "$REDIS_SENTINEL_DAEMON_USER" redis-sentinel "${args[@]}"
#else
#    exec redis-sentinel "${args[@]}"
#fi
exec redis-sentinel "${args[@]}"
