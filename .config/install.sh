#!/bin/bash

if [[ "$1" == "--server" ]]; then
  source ./server/install.sh
elif [[ -z "$1" ]]; then
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ "$(lsb_release -is)" == "archcraft" || "$(lsb_release -is)" == "arch" || "$(lsb_release -is)" == "void" ]] then
      source ./linux/arch.sh
    elif [[ "$(lsb_release -is)" == "debian" ]] then
      source ./linux/debian.sh
    elif [[ "$(lsb_release -is)" == "ubuntu" ]] then
      source ./linux/ubuntu.sh
    else
      echo "This distribution is not supported."
    fi
  elif [[ "$OSTYPE" == "darwin" ]]; then
    source ./macos/install.sh
  else
    echo "This operating system is not supported."
  fi
else
  echo "Usage: $0 [--server] - optional"
fi
