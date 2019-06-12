#!/bin/bash

set -e

#if [ ! -d ~/dotfiles ]; then
#  echo 'Cloning dotfiles'
#fi

npm run start &
/usr/sbin/sshd -D

