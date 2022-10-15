#!/usr/bin/env zsh

echo 'fzf found'
source "$HOMEBREW_REPOSITORY/opt/fzf/shell/completion.zsh"
source "$HOMEBREW_REPOSITORY/opt/fzf/shell/key-bindings.zsh"

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
	cd)           find . -type d | fzf --height 50% --border sharp --margin 5% --preview 'tree -C {} | head -n 10';;
	*)            fzf "$@" ;;
    esac
}
