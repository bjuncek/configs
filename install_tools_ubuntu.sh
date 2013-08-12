# install git
sudo apt-get update && sudo apt-get install -y git

# install zsh
sudo apt-get install -y zsh

# install oh my zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Make ZSH default
chsh -s $(which zsh)

# install rvm
\curl -L https://get.rvm.io | bash
