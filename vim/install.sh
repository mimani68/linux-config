#!/usr/bin/env bash

#
# install package managers
# 
# 1) Vvundle
# 2) Plug
# 3) Pathegon
#
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# 
# clone some project
#
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/sensible.git
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git


#
# Install YouCompelete with script
# 
sudo apt install build-essential cmake python3-dev
cd ~/.vim/bundle/youcompleteme
python3 install.py --js-completer --ts-completer

#
# Install all plugin wiht `VIM` command
#
#  $ vim PluginInstall
#  $ vim PlugInstall
#  
#

