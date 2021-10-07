git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# copy .vimrc from my github
curl -LSso $HOME/.vimrc https://raw.github.com/bjuncek/configs/master/.vimrc
echo "vimrc done"

# copy aliases
curl -LSso ~/.zsh_aliases https://raw.github.com/bjuncek/configs/master/.zsh_aliases

# copy .zshrc
curl -LSso ~/.zshrc https://raw.github.com/bjuncek/configs/master/.zshrc


conda install -c conda-forge tmux
# copy .tmux.conf
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -LSso ~/.tmux.conf https://raw.github.com/bjuncek/configs/master/tmux.conf
echo "tmux done"


source ~/.zshrc

tmux source-file ~/.tmux.conf

