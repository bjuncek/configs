#!/bin/sh

# add my fb specific aliases to local config
curl -LSso ~/.zsh_local_config https://raw.github.com/bjuncek/configs/master/.zsh_fb_aliases

# add my fb specific aliases to local config

if [ -d "$HOME/.ssh" ]; then
  echo "ssh already initialized"
else
  echo "Setting up ssh paths"
  mkdir -p "$HOME/.ssh"
  curl -LSso ~/.ssh/config https://raw.github.com/bjuncek/configs/master/fb_ssh_config
fi

# add ssh keys where applicable
ssh-copy-id -i ~/.ssh/id_rsa bkorbar@ash-fairjmp01


source $HOME/.zshrc
