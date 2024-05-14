export ZSH_PROFILE_EXECED=1


# due to a the way macos handles the path with path helper,
# we set the path in .zprofile.
# this file is sourced by .zshenv to set the path on
# non-login shells
export PATH="${HOMEBREW_PREFIX}/sbin:${HOMEBREW_PREFIX}/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"
export PATH="${CARGO_HOME}/bin:${PATH}"
export PATH="${GOBIN}:${PATH}"
export PATH="./node_modules/.bin:${PATH}"
