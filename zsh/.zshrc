#!/bin/zsh

# Load base16-colors  & lscolors
# source ~/.zsh/b16.zsh

# Load Antigen
source ~/.zsh/antigen.zsh
antigen init ~/.zsh/antigenrc
ANTIGEN_LOG=~/.zsh/antigen.log

# User configuration
export LANG=en_US.UTF-8

# Load custom configurations
source ~/.zsh/history.zsh
source ~/.zsh/environment.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/git.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/transfer.zsh
