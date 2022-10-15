# Performance Monitoring
alias cpu='top -o cpu'
alias mem='top -o rsize'

# generate a password and copy to clipboard
alias pwcopy='pwgen --capitalize --numerals --symbols --remove-chars="*" --secure 12 1 | pbcopy'

# http server
alias http='caddy file-server'

# wget - make it XDG aware
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
