__current_git_branch() {
    branch=$(git branch --show-current 2> /dev/null)
    if [[ $branch == "" ]];then
       :
    else
       echo " ($branch)"
    fi
}

setopt PROMPT_SUBST

PROMPT='%F{008}[%2~]%F{004}$(__current_git_branch) >%F{white} '
RPROMPT='%F{008}%T'
