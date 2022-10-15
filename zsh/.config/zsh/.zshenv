#!/usr/bin/env

#
# .zshenv
#

# ~/.zshenv should only be a one-liner that sources this file
# echo ". ~/.config/zsh/.zshenv" > ~/.zshenv

#
# most of the exports are here to make the system XDG compliant.
# I use `xdg-ninja` (brew install xdg-ninja) to help identify the missing
# configuration.

export TERM='rxvt-256color'
export WORKSPACE="$HOME/workspace"

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-~/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-~/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-~/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-~/.xdg}

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# Zsh
export ZDOTDIR=${ZDOTDIR:-~/.config/zsh}
export ZSH_CONFIG="$ZDOTDIR"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p $ZSH_CACHE

# Homebrew
if [ -d "/opt/homebrew" ]
then
    export HOMEBREW_PREFIX="/opt/homebrew"
else
    export HOMEBREW_PREFIX="/usr/local"
fi

export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX";
export HOMEBREW_CELLAR="$HOMEBREW_REPOSITORY";
export HOMEBREW_CASKROOM="$HOMEBREW_REPOSITORY/Caskroom"

# Pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# nodejs
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# Vim
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

# FZF
export FZF_DEFAULT_COMMAND="fd --type f --no-ignore-vcs --hidden --exclude '.git' --exclude 'node_modules'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:red,\
prompt:gray,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--color='$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"

# golang
export GOPATH="$WORKSPACE/go"
export GOBIN="$WORKSPACE/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# Rust & Cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

# Ruby bundler
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"   

# less
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# minikube
export MINIKUBE_HOME="$XDG_DATA_HOME/minikube"

# terminfo
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

# gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
