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
#   Set .vimrc to https://raw.github.com/bjuncehk/configs/master/.vimrc
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

# install vimplug
if [ -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "Vimplug already installed."
else
  echo "Installing vim plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


if [ -d "$HOME/bin" ]; then
  echo "BinDir already initialized"
else
  echo "Setting up bin paths"
  mkdir -p "$HOME/bin"
fi

# if [ -f "$HOME/.ssh/id_rsa" ]; then
#   echo "SSH keys already initialized"
# else
#   echo "Setting up SSH Keys"
#   ssh-keygen
#   echo "Copying SSH Keys to the robots login servers"
#   ssh-copy-id korbar@login.robots.ox.ac.uk
#   echo "Making the ssh config file"
#   cat ./ssh_configs/vgg >> ~/.ssh/config
#   cat ./ssh_configs/qs >> ~/.ssh/config
#   echo "verify that things are ok in a sec"
#   sleep 1
#   vim ~/.ssh/config
#   echo "Copying SSH Keys to the vgg devmachines servers"
#   ssh-copy-id korbar@vgg
# fi

echo "Copying VIM config"
curl -LSso $HOME/.vimrc https://raw.github.com/bjuncek/configs/master/.vimrc
echo "Run :PlugInstall in new vim instance" 


if [ -d "$HOME/bin/miniconda" ]; then
  echo "Miniconda already initialized"
else
  echo "Setting up miniconda"
  curl -LSso ~/bin/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  bash ~/bin/miniconda.sh
fi

echo "Setting up tmux from conda"
conda install -c conda-forge tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -LSso ~/.tmux.conf https://raw.github.com/bjuncek/configs/master/tmux.conf

echo "Reload configs"
source ~/.zshrc
tmux source-file ~/.tmux.conf
