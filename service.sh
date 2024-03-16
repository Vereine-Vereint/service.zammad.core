SERVICE_NAME="TEMPLATE-PLEASE-CHANGE"
SERVICE_VERSION="v0.1"

set -e

SERVICE_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
echo "[$SERVICE_NAME] $SERVICE_VERSION ($(git rev-parse --short HEAD))"
cd $SERVICE_DIR

# CORE
source ./core/core.sh
# BORG
source ./borg/borg.sh

# COMMANDS
commands+=([example]="<msg>:Example command that prints <msg>")
cmd_example() {
  echo "Example: $1"
}

# ATTACHMENTS
att_preStart() {
  # execute before starting the service
}

att_configure() {
  # execute before starting or restarting the service
  updateTemplates
}

# FUNCTIONS
updateTemplates() {
  #
  generate "example"
}

main "$@"
