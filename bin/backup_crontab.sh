filename="crontab.$(hostname)"
crontab -l > ~/.dotfiles/$filename
cd ~/.dotfiles
git add $filename
git commit -m "crontab backup created"
cd -
