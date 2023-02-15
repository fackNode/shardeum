#!/bin/bash

check_port() {
  if nc -z localhost $1; then
    return 0
  else
    return 1
  fi
}

portHMEXT=9001
portSHMINT=10001

while true; do
  if check_port $portHMEXT; then
    portHMEXT=$(shuf -i 1025-65536 -n 1)
  else
    break
  fi
done

while true; do
  if check_port $portSHMINT; then
    portSHMINT=$(shuf -i 1025-65536 -n 1)
  else
    break
  fi
done

HMX=$portHMEXT
SHN=$portSHMINT

export HMX
export SHN
