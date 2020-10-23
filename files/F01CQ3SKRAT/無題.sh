#!/bin/bash
OUT=()
IFS=$'\n'
for line in $(tmux ls); do
  case "$line" in
    *attach*)
      OUT=($OUT "#[bold][${line%%:*}]#[nobold]")
      ;;
    *)
      OUT=($OUT "${line%%:*}")
      ;;
  esac
done
echo "${OUT[@]}"