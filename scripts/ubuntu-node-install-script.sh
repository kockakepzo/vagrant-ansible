#!/bin/sh

NODENAME=$(hostname -s)

sudo apt -y update
sudo apt -y dist-upgrade
sudo apt install -y curl apt-transport-https bash-completion binutils ca-certificates gnupg lsb-release