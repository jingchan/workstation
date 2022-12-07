#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Commenting out to see if we need this.
# To resolve `zsh compinit: insecure directories` warnings
#chmod go-w '/opt/homebrew/share'
#chmod -R go-w '/opt/homebrew/share/zsh'

# Install nodeJS
# brew install node

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install bazel
# brew install bazelisk


