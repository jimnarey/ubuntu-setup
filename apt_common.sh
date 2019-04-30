#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get distupgrade -y
apt-get install -y build-essential git gparted python python3 python-pip python3-pip zsh openssh-server \
        wget curl mount-img nano vim terminator fonts-powerline
sudo -H $SUDO_USER cp $HOME/.bashrc $HOME/.zshrc # Check

