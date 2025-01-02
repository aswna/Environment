#!/usr/bin/env bash

set -euo pipefail

title()
{
    echo
    echo "=== ${*}"
}

title "apt update"
apt update

title "apt upgrade"
apt upgrade

title "apt dist-upgrade"
apt dist-upgrade

title "apt list upgradable"
apt list --upgradable

title "apt upgrade upgradeable"
apt upgrade $(apt list --upgradable 2>/dev/null | awk -F/ '/\//{print $1}' | sort -u)

title "apt autoremove"
apt autoremove

title "apt autoclean"
apt autoclean

title "update grub"
update-grub

title "apt autoremove"
apt --purge autoremove

title "snap refresh"
snap refresh --list
snap refresh
snap refresh --list

title "OK"
