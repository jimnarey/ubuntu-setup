#!/bin/zsh

sudo -H $SUDO_USER wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh

echo 'export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"' >> $HOME/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.zshrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $HOME/.zshrc

