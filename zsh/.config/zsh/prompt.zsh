__current_git_branch() {
    branch=$(git branch --show-current 2> /dev/null)
    if [[ $branch == "" ]];then
       :
    else
       echo " ($branch)"
    fi
}

setopt PROMPT_SUBST
unsetopt PROMPT_SP # removes hanging '%' in vterm (see https://unix.stackexchange.com/questions/167582/why-zsh-ends-a-line-with-a-highlighted-percent-symbol/167600#167600)

PROMPT='%F{008}[%2~]%F{004}$(__current_git_branch) >%F{white} '
RPROMPT='%F{008}%T'
