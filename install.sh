#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shell
ln -s ${BASEDIR}/zsh/antigen/antigen.zsh ~/.antigen.zsh
ln -s ${BASEDIR}/zsh/zshrc ~/.zshrc
chsh -s /bin/zsh

# vim
ln -s ${BASEDIR}/vim ~/.vim
vim +PluginInstall +qall

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/gitignore ~/.gitignore

# ruby

# node
