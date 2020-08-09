function update-go {
  echo updating go
  cd ~
  local bin="\"$(go env GOPATH)/bin/\""
  local fmt="\"%.$((${#$(go env GOPATH)}+5))s\""
  fmt="$(
    echo -n "{{if eq ${bin} (printf ${fmt} .Target)}}";
    echo -n "{{.Target}} {{.ImportPath}}";
    echo -n "{{end}}";
  )" 
  go list -f "${fmt}" all 2>/dev/null | while read line ; do
    local pkg="${line##* }"
    if [ -x "${line%% *}" ]; then
      echo "update ${pkg}"
      go get -u "${pkg}" || :
    fi
  done
  # gogh list --primary --format full | while read project; do
  #   cd "${project}"
  #   echo "$(go list -f "${fmt}" ./... 2>/dev/null || :)" | while read line ; do
  #     local pkg="${line##* }"
  #     if [ -x "${line%% *}" ]; then
  #       echo "update ${pkg}"
  #       go get -u "${pkg}" || :
  #     fi
  #   done
  # done
}
