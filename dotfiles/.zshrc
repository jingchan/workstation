
# _`ZSH` Completions_
#
# Allows for using `tab` in `zsh` to complete sub-commands and CLI arguments.
#
# We set this up from `homebrew`'s `zsh` directory to include any completions
# installed from through `homebrew`.
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

# _`ZSH` Beeps_
#
# These can be annoying, so we like to turn them off.

# Turn off all beeps.
unsetopt BEEP
# Turn off autocomplete beeps.
# unsetopt LIST_BEEP
