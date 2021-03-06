#!/bin/bash
set -o errexit

CMD="/usr/bin/murano-api"
ARGS="--config-file /etc/murano/murano.conf"

# Loading common functions.
source /opt/kolla/kolla-common.sh

# Execute config strategy
set_configs

# Bootstrap and exit if KOLLA_BOOTSTRAP variable is set. This catches all cases
# of the KOLLA_BOOTSTRAP variable being set, including empty.
if [[ "${!KOLLA_BOOTSTRAP[@]}" ]]; then
    su -s /bin/sh -c "murano-db-manage --config-file /etc/murano/murano.conf upgrade" murano
    exit 0
fi

exec $CMD $ARGS
