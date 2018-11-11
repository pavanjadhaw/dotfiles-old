#!/usr/bin/env zsh

# Load Antigen
source ~/.zsh/antigen.zsh
antigen init ~/.zsh/antigenrc

# load custom configuration
source ~/.zsh/aliases.zsh
source ~/.zsh/history.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
