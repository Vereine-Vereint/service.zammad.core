SERVICE_NAME="zammad"
SERVICE_VERSION="v0.1"

set -e

SERVICE_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
echo "[$SERVICE_NAME] $SERVICE_VERSION ($(git rev-parse --short HEAD))"
cd $SERVICE_DIR

# VARIABLES
set -o allexport
VERSION=6.2
IMAGE_REPO=ghcr.io/zammad/zammad

ELASTICSEARCH_VERSION=8.8.0

MEMCACHE_VERSION=1.6.20-alpine
MEMCACHE_SERVERS=zammad-memcached:11211

POSTGRES_VERSION=15.3-alpine
POSTGRES_HOST=zammad-postgresql
POSTGRES_PORT=5432
POSTGRES_USER=zammad
POSTGRES_PASS=zammad
POSTGRES_DB=zammad_production

REDIS_VERSION=7.0.5-alpine
REDIS_URL=redis://zammad-redis:6379
set +o allexport

# CORE
source ./core/core.sh
# BORG
source ./borg/borg.sh

# COMMANDS

# ATTACHMENTS

# FUNCTIONS

main "$@"
