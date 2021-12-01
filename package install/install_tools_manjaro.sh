sudo pacman -Syu
sudo pacman -S yay

pacman -S chromium vim htop zsh ccze git curl

yay -S teams slack spotify visual-studio-code-bin zoom 1password


if [ -f "$HOME/.zshrc" ]; then
  echo "ZSH already set up"
else
  echo "Setting up the ohmyzsh"
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
  # copy .zshrc
  curl -LSso ~/.zshrc https://raw.github.com/bjuncek/configs/master/.zshrc
  chsh -s $(which zsh)
fi
