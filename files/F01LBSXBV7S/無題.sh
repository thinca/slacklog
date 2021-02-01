#!/usr/bin/env bash

current_session=$(tmux list-sessions | grep 'attached' | cut -d":" -f1)

tmux list-sessions | while read -r line
do
  session=$(echo "$line" | cut -d":" -f1)
  if [ "$current_session" = "$session" ];
  then
    echo -n "#[bold][$session]#[nobold] "
  else
    echo -n "$session "
  fi
done | sed -e 's/ \+$//'