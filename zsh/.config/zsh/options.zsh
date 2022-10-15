# increase history size limit
HISTSIZE=15000 # history size in memory
SAVEHIST=10000 # history to save to file

# Different History files for root and standard user
if (( ! EUID )); then
    HISTFILE=$ZSH_CACHE/history_root
else
    HISTFILE=$ZSH_CACHE/history
fi

setopt SHARE_HISTORY          # share command history data
setopt APPEND_HISTORY         # allow multiple parallel sessions
setopt EXTENDED_HISTORY       # save commands with timestamps
setopt HIST_NO_STORE          # remove the history command from the history list
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicate first when HISTFILE size exceed HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicate commands history list
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_FIND_NO_DUPS      # do not show duplicates when searching
setopt HIST_SAVE_NO_DUPS      # do not save duplicates

# no Beep on error in ZLE.
setopt NO_BEEP

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# Don't print the directory stack after pushd or popd
setopt PUSHD_SILENT

# If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends.
setopt COMPLETE_IN_WORD
