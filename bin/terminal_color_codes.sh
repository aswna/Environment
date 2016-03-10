#!/bin/bash
#
# This file echoes a bunch of color codes to the
# terminal to demonstrate what's available.  Each
# line is the color code of one foreground color,
# out of 17 (default + 16 escapes), followed by a
# test use of that color on all nine background
# colors (default + 8 escapes).

TEXT='gYw'  # The test text

FGS=(
    '    m'
    '   1m'
    '  30m'
    '1;30m'
    '  31m'
    '1;31m'
    '  32m'
    '1;32m'
    '  33m'
    '1;33m'
    '  34m'
    '1;34m'
    '  35m'
    '1;35m'
    '  36m'
    '1;36m'
    '  37m'
    '1;37m'
)

BGS=(
    '40m'
    '41m'
    '42m'
    '43m'
    '44m'
    '45m'
    '46m'
    '47m'
)

echo
echo -e "                 40m     41m     42m     43m     44m     45m     46m     47m"
for fgcol in "${FGS[@]}"; do
    fgc=${fgcol// /}
    echo -en " ${fgcol} \033[${fgc}  ${TEXT}  "
    for bgc in ${BGS[@]}; do
        echo -en " \033[${fgc}\033[${bgc}  ${TEXT}  \033[0m"
    done
    echo
done
echo
