#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# To resolve `zsh compinit: insecure directories` warnings
chmod go-w '/opt/homebrew/share'
chmod -R go-w '/opt/homebrew/share/zsh'

# Install nodeJS
# brew install node

# Install rust
# brew install rust

# Install bazel
brew install bazelisk
