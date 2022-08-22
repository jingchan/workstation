# Add `brew` to path.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  

alias ls=ls -G
