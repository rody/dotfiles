# for testing
export ZSHENV_EXECED=1

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

  # homebrew
  if [[ -d /opt/homebrew ]]; then
    export HOMEBREW_PREFIX=/opt/homebrew
  else
    export HOMEBREW_PREFIX=/usr/local
  fi

  export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX"
  export HOMEBREW_CELLAR="$HOMEBREW_REPOSITORY/Cellar"
  export HOMEBREW_BUNDLE_FILE="$DOTFILES/brew/Brewfile"
  export PATH="${HOMEBREW_REPOSITORY}/bin:${HOMEBREW_REPOSITORY}/sbin${PATH+:$PATH}";
  export MANPATH="${HOMEBREW_REPOSITORY}/share/man${MANPATH+:$MANPATH}:"
  export INFOPATH="${HOMEBREW_REPOSITORY}/share/info:${INFOPATH:-}"
  export NPM_GLOBAL_ROOT="$HOMEBREW_PREFIX/lib/node_modules"
  # Postgres utilities (install via `brew install libpq`)
  export LIBPQ_PATH="${HOMEBREW_REPOSITORY}/opt/libpq/bin"
  export PATH="${HOMEBREW_REPOSITORY}/bin:${HOMEBREW_REPOSITORY}/sbin:${PATH}";
fi

export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
if [ ! -d "$ZSH_CACHE" ]; then
    mkdir -p "$ZSH_CACHE"
fi

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
# gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# sf cli
export SF_DISABLE_TELEMETRY=true
export SF_DISABLE_AUTOUPDATE=true
export SF_DOMAIN_RETRY=0
export SF_IMPROVED_CODE_COVERAGE=true

# remove duplicat entries from $PATH
# zsh uses $path array along with $PATH
typeset -U PATH path

source "${HOME}/.zprofile"
