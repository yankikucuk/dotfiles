#!/bin/bash

apt-get update
apt-get upgrade
apt install curl
apt install git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo apt-get install build-essential
brew install gcc
brew install node@20
brew install corepack
brew install wget
corepack use pnpm@latest
curl -fsSL https://bun.sh/install | bash
curl -fsSL https://deno.land/install.sh | sh
sudo apt install i3
sudo apt-get install feh
sudp apt-get install thunar
