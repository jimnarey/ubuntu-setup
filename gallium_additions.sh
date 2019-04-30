#!/bin/bash

cp *.list /etc/apt/sources.list.d/

curl https://apt.galliumos.org/galliumos.gpg | apt-key add

apt update
apt dist-upgrade -y
sed -i 's/900/1/' /etc/apt/preferences.d/galliumos.pref
apt dist-upgrade -y
apt install -y linux-image-galliumos-braswell galliumos-braswell

apt purge linux*generic
update-grub