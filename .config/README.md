## Pre-requisites

You need to do this before cloning the repo, otherwise the `zinit` script in zsh will error

### Install command line tools

```sh
sudo xcode-select --install
```

### Install homebrew (required by fnm)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Rust (required by alacritty)

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Install alacritty

https://alacritty.org/

### (Optional) install tmux

```sh
brew install tmux
```

## Install instructions

in your home dir, clone the repo

```sh
git clone <URL> --bare  
```

open a new terminal. you should see zinit installing.

### appendix A: how dotfiles get tracked by git

we are using the bare repo method

more info
- https://www.atlassian.com/git/tutorials/dotfiles
- https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/

```
git init --bare $HOME/.config-bare
alias config='/usr/bin/git --git-dir=$HOME/.config-bare/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.config-bare/ --work-tree=$HOME'" >> $HOME/.config/zsh/.zshrc
```