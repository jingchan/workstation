ssh-keygen -t ed25519 -C "jingchan@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

gh auth login
