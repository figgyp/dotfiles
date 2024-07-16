#####################
# ZINIT             #
#####################
### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma-continuum/zinit)…%f"
    command mkdir -p "$(dirname $ZINIT_HOME)"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
unalias zi
### End of Zinit installer's chunk

# Load starship theme
zinit ice depth=1 as"command" from"gh-r" \
    atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
    atload"export STARSHIP_LOG=error" \
    atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit ice wait lucid atload"ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20 _zsh_autosuggest_start; bindkey '^y' autosuggest-accept"
zinit light zsh-users/zsh-autosuggestions

# SYNTAX HIGHLIGHTING
zinit ice lucid wait atinit"zpcompinit;zicdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

# NVM/FNM
# export NVM_AUTO_USE=true
zinit ice wait lucid
zinit light "dominik-schwabe/zsh-fnm"

# BurntSushi/ripgrep
zinit ice lucid wait as"command" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg"
zinit light BurntSushi/ripgrep


# BAT-EXTRAS
zinit ice wait as"program" pick"src/batgrep.sh" lucid atload"alias brg=batgrep.sh"
zinit light eth-p/bat-extras


# GIT
zinit ice lucid wait
zinit snippet OMZ::lib/git.zsh

zinit ice lucid wait
zinit snippet OMZ::plugins/git/git.plugin.zsh


# LAZYGIT
zinit ice lucid wait as"program" from"gh-r" mv"lazygit* -> lazygit" atload"alias lg='lazygit'"
zinit light 'jesseduffield/lazygit'



# stedolan/jq
zinit ice lucid wait as"command" from"gh-r" mv"jq* -> jq" pick"jq/jq"
zinit light jqlang/jq

# CARGO completions
zinit ice lucid nocompile
zinit load MenkeTechnologies/zsh-cargo-completion

# NPM COMPLETIONS
zinit ice lucid nocompile
zinit load lukechilds/zsh-better-npm-completion

# NVIM
zinit ice lucid wait as"command" from"gh-r" ver"nightly" extract"!" pick"bin/nvim" \
    atload'alias nv='nvim""
zinit light neovim/neovim

# btop
zinit ice lucid wait'1' \
    as"program" \
    make \
    pick"bin/btop" \
    atload"alias top='btop'"
zinit light aristocratos/btop

#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=290000
SAVEHIST=$HISTSIZE


#####################
# SETOPT            #
#####################
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
# setopt completealiases        # complete alisases
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
unsetopt BEEP
setopt  autocd autopushd
setopt vi

#####################
# COLORING          #
#####################
autoload colors && colors

#####################
# ALIASES           #
#####################
source "$HOME"/.config/zsh/.aliases


export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
