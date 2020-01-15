#!/bin/sh

# This script is used to:
#   Install Pathogen if necessary
#   Install Vim solarized
#   Install Nerdtree for vim
#   Install nerdcommenter for vim
#   Install AutoComplPop
#   Install vim-fugitive
#   Install ctrlp
#   Install vim-better-whitespace
#   Install oh-my-zsh
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

# check required libs exist
if [ $has_curl ] && [ $has_git ] && [ $has_zsh ] && [ $has_vim ]; then
  echo "All required libs exist..."
else
  echo "One or more of curl, git, zsh, vim is not installed. Exiting..."
  exit 1
fi

# install pathogen
if [ -f "$HOME/.vim/autoload/pathogen.vim" ]; then
  echo "Pathogen already installed."
else
  echo "Installing pathogen"
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

# install vim solarized
if [ -d "$HOME/.vim/bundle/nord-vim" ]; then
  echo "Vim Solarized is already installed"
else
  echo "Installing Nord Colorscheme"
  git clone git@github.com:arcticicestudio/nord-vim.git ~/.vim/bundle/vim-colors-solarized
fi

# install nerdtree
if [ -d "$HOME/.vim/bundle/nerdtree" ]; then
  echo "Nerdtree already installed"
else
  echo "Installing Nerdtree"
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi

# install nerdcommenter
if [ -d "$HOME/.vim/bundle/nerdcommenter" ]; then
  echo "nerdcommenter already installed"
else
  echo "Installing nerdcommenter"
  git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
fi

# install AutoComplPop
if [ -d "$HOME/.vim/bundle/AutoComplPop" ]; then
  echo "AutoComplPop already installed"
else
  echo "Installing AutoComplPop"
  git clone https://github.com/vim-scripts/AutoComplPop.git ~/.vim/bundle/AutoComplPop
fi

# install vim-fugitive
if [ -d "$HOME/.vim/bundle/vim-fugitive" ]; then
  echo "vim-fugitive already installed"
else
  echo "Installing vim-fugitive"
  git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
fi

if [ -d "$HOME/.vim/bundle/ctrlp.vim" ]; then
  echo "ctrlp already installed"
else
  echo "Installing ctrlp"
  git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
fi

if [ -d "$HOME/.vim/bundle/vim-better-whitespace" ]; then
  echo "vim-better-whitespace already installed"
else
  echo "Installing vim-better-whitespace"
  git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
fi

if [ -d "$HOME/bin" ]; then
  echo "BinDir already initialized"
else
  echo "Setting up bin paths"
  mkdir -p "$HOME/bin"
fi

if [ -d "$HOME/bin/fonts" ]; then
  echo "Fonts already isntalled"
else
  echo "Setting up bin paths"
  git clone https://github.com/powerline/fonts.git "$HOME/bin/fonts"
  sh "$HOME/bin/fonts/install.sh"
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh already installed"
else
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# copy .vimrc from my github
curl -LSso ~/.vimrc https://raw.github.com/bjuncek/configs/master/.vimrc
echo "vimrc done"
# copy aliases
curl -LSso ~/.zsh_aliases https://raw.github.com/bjuncek/configs/master/.zsh_aliases

# copy .zshrc
curl -LSso ~/.zshrc https://raw.github.com/bjuncek/configs/master/.zshrc

# copy .tmux.conf
curl -LSso ~/.tmux.conf https://raw.github.com/bjuncek/configs/master/.tmux.conf
echo " tmux done"

# setup homebrew if mac
if [ -d "$HOME/.brew" ]; then
  echo "Brew already initialized"
else
  echo "Setting up bin homebrew"
  git clone https://github.com/Homebrew/brew ~/.brew
  echo 'export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"' >> ~/.zshrc
  echo 'export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"' >> ~/.bash_profile
  source ~/.bash_profile
fi
source ~/.zshrc

brew update
brew install tmux

tmux source-file ~/.tmux.conf

