# Performance Monitoring
alias cpu='top -o cpu'
alias mem='top -o rsize'

# generate a password and copy to clipboard
alias pwcopy='pwgen --capitalize --numerals --symbols --remove-chars="*" --secure 12 1 | pbcopy'

# http server
alias http='caddy file-server'

# wget - make it XDG aware
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# ls
alias ll="ls -al"

# df
alias df="df -h"

# copy/rsync
alias cpv='rsync -ah --progress'

# sfdx
alias sfopen='sfdx force:org:open'
alias sforgs='sfdx org list --skip-connection-status'
alias sfdisplay='sfdx force:org:display --verbose'
alias sfpush='sfdx force:source:push'
alias sfpull='sfdx force:source:pull'
alias sfcreate='sfdx force:org:create'

# emacs
alias em="emacsclient -t -a ''"
