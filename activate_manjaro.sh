# copy .vimrc from my github
curl -LSso $HOME/.vimrc https://raw.github.com/bjuncek/configs/master/.vimrc
echo "vimrc done"


# setup conda install of tmux
echo "Dealing with TMUX"
conda install -c conda-forge tmux

# get tmux plugin manager
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# copy .tmux.conf
curl -LSso ~/.tmux.conf https://raw.github.com/bjuncek/configs/master/tmux.conf

tmux source-file ~/.tmux.conf
echo "tmux done"

echo "NOTE: Please run the tmux plugin loading scheme [<leader> + shift + i]"
