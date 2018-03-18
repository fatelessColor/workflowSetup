#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim

apt-get install $(cat workflowSetup/basicPackages)
apt-get install $(cat workflowSetup/creativeTools)
apt-get install $(cat workflowSetup/guiPackages)
apt-get install $(cat workflowSetup/otherTools)
apt-get install $(cat workflowSetup/programmerTools)
rsync -r workflowSetup/.vim/ .vim
rsync -r workflowSetup/.config/ .config
