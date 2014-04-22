#!/bin/sh

# This script is used to:
#   Install Pathogen if necessary
#   Install Vim solarized
#   Install Nerdtree for vim
#   Install Ack for vim
#   Install AutoComplPop
#   Set .vimrc to https://raw.github.com/ChengLong/configs/master/.vimrc
#   Set .zsh_aliases to https://raw.github.com/ChengLong/configs/master/.zsh_aliases
#   Set .zshrc to https://raw.github.com/ChengLong/configs/master/.zshrc
#   Set pygmalion.zsh-theme to https://raw.github.com/ChengLong/configs/master/pygmalion.zsh-theme
#   Source .zshrc
#   Source tmux config
#
# It's assumed that these libs are already installed
#   1. curl
#   2. git
#   3. zsh
#   4. vim
#   5. ack

exists() {
  if hash $1 2>/dev/null; then
    return 0
  else
    echo "$1 doesn't exist"
    return 1
  fi
}

exists curl
has_curl=$?

exists git
has_git=$?

exists zsh
has_zsh=$?

exists vim
has_vim=$?

exists ack-grep 
has_ack=$?

# check required libs exist
if [ $has_curl ] && [ $has_git ] && [ $has_zsh ] && [ $has_vim ] && [ $has_ack ]; then
  echo "All required libs exist..."
else
  echo "One or more of curl, git, zsh, vim, ack-grep is not installed. Exiting..."
  exit 1
fi

# install pathogen
if [ -f "$HOME/.vim/autoload/pathogen.vim" ]; then
  echo "Pathogen already installed."
else
  echo "Installing pathogen"
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

# install vim solarized
if [ -d "$HOME/.vim/bundle/vim-colors-solarized" ]; then
  echo "Vim Solarized is already installed"
else
  echo "Installing Vim Solarized"
  git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
fi

# install nerdtree
if [ -d "$HOME/.vim/bundle/nerdtree" ]; then
  echo "Nerdtree already installed"
else
  echo "Installing Nerdtree"
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi

# install nerdtree
if [ -d "$HOME/.vim/bundle/AutoComplPop" ]; then
  echo "AutoComplPop already installed"
else
  echo "Installing AutoComplPop"
  git clone https://github.com/vim-scripts/AutoComplPop.git ~/.vim/bundle/AutoComplPop
fi

# install ack.vim 
if [ -f "$HOME/.vim/plugin/ack.vim" ]; then
  echo "ack.vim already installed"
else
  echo "Installing ack.vim"
  git clone https://github.com/mileszs/ack.vim.git ~/ack.vim
  mkdir -p ~/.vim/doc
  mkdir -p ~/.vim/plugin
  cp ~/ack.vim/doc/ack.txt ~/.vim/doc
  cp ~/ack.vim/plugin/ack.vim ~/.vim/plugin
fi


# copy .vimrc from my github
curl https://raw.github.com/ChengLong/configs/master/.vimrc > ~/.vimrc

# copy aliases
curl https://raw.github.com/ChengLong/configs/master/.zsh_aliases > ~/.zsh_aliases

# copy .zshrc
curl https://raw.github.com/ChengLong/configs/master/.zshrc > ~/.zshrc

# copy pygmalion.zsh-theme
curl https://raw.github.com/ChengLong/configs/master/pygmalion.zsh-theme > ~/.oh-my-zsh/themes/pygmalion.zsh-theme

# copy .tmux.conf
curl https://raw.github.com/ChengLong/configs/master/.tmux.conf > ~/.tmux.conf

source ~/.zshrc
tmux source-file ~/.tmux.conf
