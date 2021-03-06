#!/bin/bash
set -o errexit

CMD="/usr/bin/heat-engine"
ARGS=""

# Loading common functions.
source /opt/kolla/kolla-common.sh

# Execute config strategy
set_configs

# Bootstrap and exit if KOLLA_BOOTSTRAP variable is set. This catches all cases
# of the KOLLA_BOOTSTRAP variable being set, including empty.
if [[ "${!KOLLA_BOOTSTRAP[@]}" ]]; then
    su -s /bin/bash -c "/usr/bin/heat-manage db_sync" heat
    exit 0
fi

exec $CMD $ARGS
