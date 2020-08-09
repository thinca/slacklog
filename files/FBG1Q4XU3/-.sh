function vim () {
  if [ -t 0 ]; then
    command vim $@ < /dev/tty
  else
    local f=$(mktemp)
    cat /dev/stdin > "$f"
    command vim "$f" < /dev/tty
    rm -f "$f" || :
  fi
}