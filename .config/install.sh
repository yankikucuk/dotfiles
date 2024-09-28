#!/bin/bash

# some docs was here!

if [[ "$1" == "--server" ]]; then
  source ./server/install.sh
elif [[ -z "$1" ]]; then
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source ./linux/install.sh
  elif [[ "$OSTYPE" == "darwin" ]]; then
    source ./macos/install.sh
  else
    echo "This operating system is not supported."
  fi
else
  echo "Usage: $0 [--server] - optional"
fi