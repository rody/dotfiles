# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Uncomment to measure startup time
# bootTimeStart=$(gdate +%s%N 2>/dev/null || date +%s%N)

# set zsh options
source "$ZSH_CONFIG/options.zsh"

# configure zsh prompt
#source "$ZSH_CONFIG/prompt.zsh"

# configure aliases
source "$ZSH_CONFIG/aliases.zsh"

# configure bindings
source "$ZSH_CONFIG/bindings.zsh"

# configure completion
source "$ZSH_CONFIG/completion.zsh"

# configure additional plugins
source "$ZSH_CONFIG/plugins/fzf.zsh"

# configure additional functions
for file in $ZSH_CONFIG/functions/*; do
    autoload -Uz "$file"
done

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH="$HOME/.local/share/gem/bin:$PATH"
fi

eval "$(starship init zsh)"

vterm-printf() {
    if [[ -n "$TMUX" ]]; then
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [[ "${TERM%%-*}" = "screen" ]]; then
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    alias clear='vterm-printf "51;Evterm-clear-scrollback";tput clear'
fi

vterm-prompt-end() {
    vterm-printf "51;A$(whoami)@$(hostname):$(pwd)";
}

PROMPT=$PROMPT"%{$(vterm-prompt-end)%}"


export GPG_TTY=$(tty)

### uncoment to print the startup time
# bootTimeEnd=$(gdate +%s%N 2>/dev/null || date +%s%N)
# bootTimeDuration=$((($bootTimeEnd - $bootTimeStart) / 1000000))
# echo $bootTimeDuration ms overall boot duration

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
