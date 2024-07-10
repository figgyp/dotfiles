## What is this?

Storing dotfiles via bare repo strategy. We rely (mostly) on [zinit](https://github.com/zdharma-continuum/zinit) to manage our shell dependencies in `.zshrc`.

Read more:
- https://www.atlassian.com/git/tutorials/dotfiles
- https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/

## Prerequisites

xcode - so we can run git commands
```sh
sudo xcode-select --install
```

homebrew - required by fnm
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

rust - required by starship
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Usage

in your $HOME dir, clone the repo w/ bare flag

```sh
git@github.com:jdrury/dotfiles.git --bare  
```

open a new terminal instance. you should see zinit installing.

## post-installation

You probably want to install tmux, and [alacritty](https://alacritty.org/).

```sh
brew install tmux
```

And you probably want to update git user info in `./config/git/config` (name, email).
