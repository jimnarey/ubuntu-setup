#!/bin/zsh

sudo -H $SUDO_USER chsh -s $(which zsh)
chsh -s $(which zsh)
sudo -H $SUDO_USER sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
