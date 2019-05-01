#!/usr/bin/env bash

_DEBIAN_FRONTEND=$DEBIAN_FRONTEND
export DEBIAN_FRONTEND=noninteractive

USER_HOME=$(sudo -u $SUDO_USER echo $HOME)

mkdir $USER_HOME/.ubstemp
cd $USER_HOME/.ubstemp

mkdir $USER_HOME/Projects

#Check -y flag for upgrade and dist-upgrade

#Main package install
apt-get update
apt-get upgrade -y
apt-get distupgrade -y
apt-get install -y build-essential git gparted python python3 python-pip python3-pip zsh openssh-server \
        wget curl mount-img nano vim terminator fonts-powerline exfat-fuse exfat-utils tmux

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

#Zsh Setup
sudo -u $SUDO_USER cp $USER_HOME/.bashrc $USER_HOME/.zshrc
# Check about generating zsh default config
sudo -u $SUDO_USER chsh -s $(which zsh)
chsh -s $(which zsh)
sudo -u $SUDO_USER sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# Remove Ruby from prompt

#Ruby Install
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


#x86_amd64 Only
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install -y sublime-text steam-installer


#GalliumOS packages install and setup
#cp *.list /etc/apt/sources.list.d/
#curl https://apt.galliumos.org/galliumos.gpg | apt-key add
#apt update
#apt dist-upgrade -y
#sed -i 's/900/1/' /etc/apt/preferences.d/galliumos.pref # Test this
#apt dist-upgrade -y
#apt install -y linux-image-galliumos-braswell galliumos-braswell
#apt purge linux*generic
#update-grub

#Crouton chroot only
# Map shared drives
# What else?

#Setup Terminator
# Solarised, font size


#Cleanup

apt-get autoremove
apt-get clean
apt-get autoclean
cd ../
rm -rf ./.ubstemp
export DEBIAN_FRONTEND=$_DEBIAN_FRONTEND