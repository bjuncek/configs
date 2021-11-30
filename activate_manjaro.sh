# copy .vimrc from my github
curl -LSso $HOME/.vimrc https://raw.github.com/bjuncek/configs/master/.vimrc
echo "vimrc done"

# copy aliases to main zshrc
cat .zsh_aliases >> ~/.zshrc

# add ssh vgg configs
cat ./ssh_configs/vgg >> ~/.ssh/config
cat ./ssh_configs/qs >> ~/.ssh/config

# setup conda install of tmux
conda install -c conda-forge tmux

# get tmux plugin manager
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# copy .tmux.conf
curl -LSso ~/.tmux.conf https://raw.github.com/bjuncek/configs/master/tmux.conf

tmux source-file ~/.tmux.conf
echo "tmux done"
