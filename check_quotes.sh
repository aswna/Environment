#!/bin/sh

grep --color="auto" -P -n '[^\x00-\x7F]' ~/etc/quotes.txt
if [ "${?}" -eq 0 ]; then
    exit 1
else
    exit 0
fi
