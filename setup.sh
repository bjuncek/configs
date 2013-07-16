#!/bin/sh

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# install vim solarized
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle

# install nerdtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle

# copy .vimrc from my github
curl https://raw.github.com/ChengLong/configs/master/.vimrc > ~/.vimrc

# copy aliases
curl https://raw.github.com/ChengLong/configs/master/.zsh_aliases > ~/.bash_aliases

source ~/.bashrc
