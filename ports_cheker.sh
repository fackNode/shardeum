#!/bin/bash

check_port() {
  if nc -z localhost $1; then
    return 0
  else
    return 1
  fi
}

port=8080

while true; do
  if check_port $port; then
    port=$(shuf -i 1025-65536 -n 1)
  else
    break
  fi
done

DASHPORT=$port

export DASHPORT
