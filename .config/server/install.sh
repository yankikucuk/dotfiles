#!/bin/bash

# this script provides headless setup for use cases.

apt-get update
apt-get upgrade
apt install curl
apt install git
sudo apt-get install build-essential
brew install gcc
brew install node@20
brew install corepack
brew install wget
corepack use pnpm@latest
