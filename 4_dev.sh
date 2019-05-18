#!/usr/bin/env bash

apt-get install -y libssl-dev libreadline-dev zlib1g-dev
sudo -u $SUDO_USER wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
PATH=$HOME/.rbenv/bin:$PATH
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $USER_HOME/.zshrc # Check
sudo -u $SUDO_USER rbenv install 2.6.3
sudo -u $SUDO_USER rbenv global 2.6.3


#Node Install
sudo -u $SUDO_USER wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
echo 'export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"' >> $USER_HOME/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $USER_HOME/.zshrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $USER_HOME/.zshrc

#Virtualenv install
pip install virtualenv virtualenvwrapper
sudo -u $SUDO_USER mkdir $USER_HOME/.virtualenvs/
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> $USER_HOME/.zshrc
echo 'export PROJECT_HOME=$HOME/Projects' >> $USER_HOME/.zshrc
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> $USER_HOME/.zshrc