#!/bin/sh

NODENAME=$(hostname -s)

config_path="/vagrant/configs"

if [ -d $config_path ]; then
   rm -f $config_path/*
else
   mkdir -p /vagrant/configs
fi

sudo apt -y update
sudo apt -y dist-upgrade
sudo apt install -y curl apt-transport-https bash-completion binutils ca-certificates gnupg lsb-release
