#! /bin/sh

sudo apt install $(awk '! /^\#/ && ! /^$/ {pkgs[$1]++} END {for (p in pkgs) {printf "%s%s", sep, p; sep = " "}}' pkg-deb-install)
