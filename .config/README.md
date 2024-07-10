
```
alias config='/usr/bin/git --git-dir=$HOME/.config-bare/ --work-tree=$HOME'
git clone --bare https://github.com/jdrury/dotfiles.git $HOME/.config-bare
config checkout
config config --local status.showUntrackedFiles no
```
