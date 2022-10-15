
bootTimeStart=$(gdate +%s%N 2>/dev/null || date +%s%N)

export PATH="${HOMEBREW_REPOSITORY}"/bin:$PATH

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
# FIXME: use fpath and autoload instead, see https://unix.stackexchange.com/a/33898
for file in $ZSH_CONFIG/functions/*; do
    autoload -Uz "$file"
done

bootTimeEnd=$(gdate +%s%N 2>/dev/null || date +%s%N)
bootTimeDuration=$((($bootTimeEnd - $bootTimeStart)/1000000))
echo $bootTimeDuration ms overall boot duration
