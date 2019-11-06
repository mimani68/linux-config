#!/usr/bin/env bash

# 
# get keys
# 
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# 
# install code
# 
sudo apt-get install apt-transport-https software-properties-common wget
sudo apt-get update
sudo apt-get install code
sudo apt update
sudo apt upgrade

# 
# increase watcher file
# 
sudo echo 'fs.inotify.max_user_watches=524288' >> /etc/sysctl.conf
sudo sysctl -p