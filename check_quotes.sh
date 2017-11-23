#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ETC_DIR="${SCRIPT_DIR}/etc"

grep --color="auto" -P -n '[^\x00-\x7F]' "${ETC_DIR}/quotes.txt"
if [ "${?}" -eq 0 ]; then
    exit 1
else
    exit 0
fi
