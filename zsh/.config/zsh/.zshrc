export PATH="${GOBIN}:${HOMEBREW_REPOSITORY}/bin:${HOMEBREW_REPOSITORY}/sbin${PATH+:$PATH}";

bootTimeStart=$(gdate +%s%N 2>/dev/null || date +%s%N)

export MANPATH="${HOMEBREW_REPOSITORY}/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="${HOMEBREW_REPOSITORY}/share/info:${INFOPATH:-}";

# set zsh options
source "$ZSH_CONFIG/options.zsh"

# configure zsh prompt
source "$ZSH_CONFIG/prompt.zsh"

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

bootTimeEnd=$(gdate +%s%N 2>/dev/null || date +%s%N)
bootTimeDuration=$((($bootTimeEnd - $bootTimeStart) / 1000000))
echo $bootTimeDuration ms overall boot duration
