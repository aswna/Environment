#!/usr/bin/env bash

set -euo pipefail

main()
{
    execute_with_retry "apt update"                 apt update
    execute_with_retry "apt upgrade"                apt upgrade
    execute_with_retry "apt dist-upgrade"           apt dist-upgrade
    execute_with_retry "apt autoremove"             apt autoremove
    execute_with_retry "apt list upgradable"        apt list --upgradable

    local packages
    packages=$(apt list --upgradable 2>/dev/null | awk -F/ '/\//{print $1}' | uniq)
    execute_with_retry "apt upgrade upgradeable"    apt upgrade ${packages}

    execute_with_retry "apt autoremove"             apt autoremove
    execute_with_retry "apt autoclean"              apt autoclean
    execute_with_retry "update grub"                update-grub
    execute_with_retry "apt autoremove (purge)"     apt --purge autoremove

    execute_with_retry "snap refresh list"          snap refresh --list
    execute_with_retry "snap refresh"               snap refresh
    execute_with_retry "snap refresh list"          snap refresh --list

    title "OK"
}

execute_with_retry()
{
    title "${1}"
    shift
    # echo "cmd: ${*}"

    local counter=1
    while true; do
        if ${*}; then
            break
        fi

        counter=$((counter + 1))
        if [ ${counter} -ge 5 ]; then
            exit 1
        fi

        echo "waiting 10 seconds before retry..."
        sleep 10s
    done
}

title()
{
    echo
    echo "=== ${*}"
}

main
