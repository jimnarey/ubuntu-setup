#!/usr/bin/env bash

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb # Stop this line throwing dependency errors

apt-get --fix-missing --fix-broken install


