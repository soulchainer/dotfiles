#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run light-locker --lock-on-suspend &
run nm-applet &
run firefox &
run firefox-developer-edition &
