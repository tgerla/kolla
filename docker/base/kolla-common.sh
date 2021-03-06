#!/bin/bash

set_configs() {
    case $KOLLA_CONFIG_STRATEGY in
        COPY_ALWAYS)
            source /opt/kolla/config-external.sh
            ;;
        COPY_ONCE)
            if [[ -f /configured ]]; then
                echo 'INFO - This container has already been configured; Refusing to copy new configs'
            else
                source /opt/kolla/config-external.sh
                touch /configured
            fi
            ;;

        *)
            echo '$KOLLA_CONFIG_STRATEGY is not set properly'
            exit 1
            ;;
    esac
}
