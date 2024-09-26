# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~/.zshrc file for zsh non-login shells.
# see /usr/share/doc/zsh/examples/zshrc for examples

setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
# setting ksharrays breaks autosuggest plugins
#setopt ksharrays           # arrays start at 0
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
export PROMPT_EOL_MARK=""

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[1;3C' forward-word                    # ctrl + ->
bindkey '^[[3C' forward-word                       # ctrl + ->
bindkey '^[[1;3D' backward-word                   # ctrl + <-
bindkey '^[[3D' backward-word                      # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[Z' undo                               # shift + tab undo last action

# enable completion features
fpath=("/usr/local/share/zsh/site-functions"
       "${HOMEBREW_PREFIX}/share/zsh/site-functions"
       $fpath)

if [[ -r "${HOME}/Library/Caches/sf/autocomplete/functions/zsh" ]]; then
    fpath=("${HOME}/Library/Caches/sf/autocomplete/functions/zsh"
           $fpath
          );
fi

autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion
zstyle ':autocomplete:*' default-context history-incremental-search-backward

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# force zsh to show the complete history
alias history="history 0"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x "${HOMEBREW_PREFIX}/bin/lesspipe.sh" ] && eval "$(SHELL=/bin/sh ${HOMEBREW_PREFIX}/bin/lesspipe.sh)"

# useful aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lla='ls -al'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'

# use powerline 10k
source "${HOMEBREW_PREFIX}/share/powerlevel10k/powerlevel10k.zsh-theme"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#vuse auto suggest
source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# use zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd='z'

# use eza
alias ll="eza --git -l --icons=auto  --group-directories-first"
alias lla="ll -a"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
