filename="crontab.$(hostname)"
crontab -l > ~/.dotfiles/$filename
cd ~/.dotfiles
git commit -m "crontab backup created" -- $filename
cd -
