#!/bin/zsh

sudo -H $SUDO_USER wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | zsh
PATH=$HOME/.rbenv/bin:$PATH
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshrc # Check
sudo -H $SUDO_USER rbenv install 2.6.3
sudo -H $SUDO_USER rbenv global 2.6.3

