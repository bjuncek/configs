# install ruby 2.1
sudo apt-get install -y python-software-properties
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y ruby2.1
sudo apt-get install -y ruby2.1-dev
sudo apt-get install -y libsqlite3-dev

# install git
sudo apt-get install -y git

# install curl
sudo apt-get install -y curl

# install ack
sudo apt-get install -y ack-grep

# install zsh
sudo apt-get install -y zsh

# install oh my zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# install htop
sudo apt-get install -y htop

# install ccze
sudo apt-get install -y ccze

# Make ZSH default
chsh -s $(which zsh)
