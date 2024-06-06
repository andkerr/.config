#shellcheck shell=bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

alias cusr='users | tr " " "\n" | uniq -c'

alias ducks='du -cksh * | sort -hr | head -n 15'

alias less='less -R'

alias fmake='find -type f -name "makefile*" -o -name "*.mk"'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles_git/ --work-tree=$HOME'

alias todo='/usr/bin/git --git-dir=$HOME/.todo_git/ --work-tree=$HOME'

alias ggrep='git grep --recurse-submodules'

alias mkcsc='cscope -bqi <(find -type f -name "*.[ch]" -o -name "*.cpp")'

# set operations
alias setd='comm -23 '
alias seti='comm -12 '
alias setu='comm --output-delimiter="" '
alias setsd='comm --output-delimiter="" -3 '
