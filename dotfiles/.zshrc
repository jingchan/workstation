if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  fpath+=~/.zfunc
  compinit
fi

# ZSH Beeps
# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
# unsetopt LIST_BEEP

# Python
export PATH=$PATH:$(brew --prefix)/opt/python/libexec/bin

# Customize Command Prompt
# PS1="%n@%m %1~ %# "
#PS1="%1~ %# "
PROMPT='%B%F{240}%1~%f%b %# '
#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

alias ctags="`brew --prefix`/bin/ctags"

##### STARTUP
echo "hello, human."
## Display (Vi) mode.
#RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#RPS2=$RPS1

##### BINDINGS
#bindkey "^R" history-incremental-search-backward
#bindkey "\e[A" history-beginning-search-backward
#bindkey "\e[B" history-beginning-search-forward

##### VIM KEYS STUFF
# Bind escape to command mode (Normal mode).
#bindkey '\e' vi-cmd-mode 
## Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
#export KEYTIMEOUT=1 
## Update RPS (Right PS) when changing keymap (Vi) mode.
#function zle-line-init zle-keymap-select {         
#  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"    
#  RPS2=$RPS1    
#  zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select
 
##### HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS



alias vi=nvim
alias vim=nvim
