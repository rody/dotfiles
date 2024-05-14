#!/usr/bin/env

#
# .zshenv
#

# most of the exports are here to make the system XDG compliant.
# I use `xdg-ninja` (brew install xdg-ninja) to help identify the missing
# configuration.

export TERM='rxvt-256color'
export WORKSPACE="$HOME/workspace"
export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-~/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-~/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-~/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-~/.xdg}

# macOS
if [[ "$OSTYPE" == darwin* ]]; then
  export XDG_DESKTOP_DIR=${XDG_DESKTOP_DIR:-$HOME/Desktop}
  export XDG_DOCUMENTS_DIR=${XDG_DOCUMENTS_DIR:-$HOME/Documents}
  export XDG_DOWNLOAD_DIR=${XDG_DOWNLOAD_DIR:-$HOME/Downloads}
  export XDG_MUSIC_DIR=${XDG_MUSIC_DIR:-$HOME/Music}
  export XDG_PICTURES_DIR=${XDG_PICTURES_DIR:-$HOME/Pictures}
  export XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:-$HOME/Videos}
  export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}

  if [[ -d /opt/homebrew ]]; then
    export HOMEBREW_PREFIX=/opt/homebrew
  else
    export HOMEBREW_PREFIX=/usr/local
  fi
  export BROWSER='open'
fi

export SHELL_SESSIONS_DISABLE=1

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
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
export HOMEBREW_BUNDLE_FILE="$DOTFILES/brew/Brewfile"

# Pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_GLOBAL_ROOT="$HOMEBREW_PREFIX/lib/node_modules"

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
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$XDG_DATA_HOME/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# Rust & Cargo
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
# export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$HOME/.cargo"

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

# sf cli
export SF_DISABLE_TELEMETRY=true
export SF_DISABLE_AUTOUPDATE=true
export SF_DOMAIN_RETRY=0
export SF_IMPROVED_CODE_COVERAGE=true

# zig
export ZIG_HOME="$HOME/workspaces/zig/zig-0.12.0"

# Postgres utilities (install via `brew install libpq`)
export LIBPQ_PATH="$HOMEBREW_REPOSITORY"/opt/libpq/bin

export MANPATH="${HOMEBREW_REPOSITORY}/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="${HOMEBREW_REPOSITORY}/share/info:${INFOPATH:-}";
. "$HOME/.cargo/env"
