#!/bin/bash

mkdir .temp
apt-get install | cat workflowSetup/basicPackages
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mv workflowSetup/.vim .vim
