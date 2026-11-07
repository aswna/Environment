#!/usr/bin/env bash

set -euo pipefail

main()
{
    execute_with_retry "apt update"                 apt-get update
    execute_with_retry "apt full-upgrade"           apt-get full-upgrade
    # result should be empty
    execute_with_retry "apt --just-print upgrade"   apt-get --just-print upgrade

    execute_with_retry "apt autoremove (purge)"     apt-get --purge autoremove
    execute_with_retry "apt autoclean"              apt-get autoclean

    execute_with_retry "update grub"                update-grub

    execute_with_retry "snap refresh list"          snap refresh --list
    execute_with_retry "snap refresh"               snap refresh

    title "OK"
}

execute_with_retry()
{
    title "${1}"
    shift
    # echo "cmd: ${*}"

    if [ -z "${1:-}" ] || ! command -v "${1:-}" &>/dev/null; then
        echo "    (skipped: command '${1:-}' not found)"
        return
    fi

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
    echo "=== ${*} --- $(date +'%Y-%m-%d %H:%M:%S')"
}

main
