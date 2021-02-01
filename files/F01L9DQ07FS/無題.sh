#!/bin/bash
set -euo pipefail
filename="$1"
lines=()
IFS=$'\n'
exec 3<"$filename"
while read -u 3 -r line; do
    case "$line" in
      *特定の文字*)
	lines+=("#$line")
	;;
      *)
	lines+=("$line")
	;;
    esac
done
exec 3>&-
for line in "${lines[@]}"; do
    echo "$line"
done >"$filename"
