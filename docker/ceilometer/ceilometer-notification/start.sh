#!/bin/bash

set -o errexit

CMD="/usr/bin/ceilometer-agent-notification"
ARGS=""

# Loading common functions.
source /opt/kolla/kolla-common.sh

# Execute config strategy
set_configs

exec $CMD $ARGS
