#!/usr/bin/env bash

USER_HOME=$(sudo -u $SUDO_USER echo $HOME)

#Zsh Setup
sudo -u $SUDO_USER cp $USER_HOME/.bashrc $USER_HOME/.zshrc # Why is there no .bashrc?
# Check about generating zsh default config
sudo -u $SUDO_USER chsh -s $(which zsh)
chsh -s $(which zsh)
sudo -u $SUDO_USER sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
