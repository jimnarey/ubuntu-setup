#!/bin/bash


echo $USER
echo $SUDO_USER
echo $HOME
sudo -u $SUDO_USER echo $HOME
sudo -H $SUDO_USER echo $HOME
sudo -u $SUDO_USER -H $SUDO_USER echo $HOME

DOG=$(sudo -u $SUDO_USER echo $HOME)
echo $DOG
