# Configs for environment setup 

Bored of setting up machines for development again and again? It's *tedious*. 
These are some dotfiles that I use very often. If you like [zsh](http://www.zsh.org/), [Vim](http://www.vim.org/), [Solarized](http://ethanschoonover.com/solarized) and [tmux](http://tmux.sourceforge.net/), just run 
(Prerequisite: curl, git, vim, zsh)

`curl https://raw.github.com/ChengLong/configs/master/setup.sh | zsh`

It will:
* Install Pathogen if necessary
* Install Vim solarized
* Install Nerdtree for vim
* Copy https://raw.github.com/ChengLong/configs/master/.vimrc to your .vimrc
* Copy https://raw.github.com/ChengLong/configs/master/.zsh_aliases to your .zsh_aliases
* Copy https://raw.github.com/ChengLong/configs/master/.zshrc to your .zshrc
* Copy https://raw.github.com/ChengLong/configs/master/pygmalion.zsh-theme to your pygmalion.zsh-theme
* Copy https://raw.github.com/ChengLong/configs/master/.tmux.conf to your .tmux.conf
