#!/usr/bin/env bash

mkdir $HOME/.ubstemp
cd $HOME/.ubstemp

#Main package install
apt-get update
apt-get upgrade -y
apt-get distupgrade -y
apt-get install -y build-essential git gparted python python3 python-pip python3-pip zsh openssh-server \
        wget curl mount-img nano vim terminator fonts-powerline

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

#Zsh Setup
sudo -H $SUDO_USER cp $HOME/.bashrc $HOME/.zshrc
sudo -H $SUDO_USER chsh -s $(which zsh)
chsh -s $(which zsh)
sudo -H $SUDO_USER sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


#Ruby Install
sudo -H $SUDO_USER wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
PATH=$HOME/.rbenv/bin:$PATH
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshrc # Check
sudo -H $SUDO_USER rbenv install 2.6.3
sudo -H $SUDO_USER rbenv global 2.6.3


#Node Install
sudo -H $SUDO_USER wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
echo 'export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"' >> $HOME/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.zshrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $HOME/.zshrc

#Virtualenv install
pip install virtualenv virtualenvwrapper
#
#
#

#x86_amd64 Only
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install -y sublime-text steam-installer


#GalliumOS packages install and setup
cp *.list /etc/apt/sources.list.d/
curl https://apt.galliumos.org/galliumos.gpg | apt-key add
apt update
apt dist-upgrade -y
sed -i 's/900/1/' /etc/apt/preferences.d/galliumos.pref
apt dist-upgrade -y
apt install -y linux-image-galliumos-braswell galliumos-braswell
apt purge linux*generic
update-grub

#Crouton chroot only
# Map shared drives

#Cleanup

apt-get autoremove
apt-get clean
apt-get autoclean
cd ../
rm -rf ./.ubstemp