#!/bin/bash

case $- in
    *i*) ;;
      *) return;;
esac

alias cusr='users | tr " " "\n" | uniq -c'

alias ducks='du -cksh * | sort -hr | head -n 15'

alias fcpp='find . -regex ".*\.\(h\|c\|cpp\)"'

alias less='less -R'

alias fmake='find -type f -name "makefile*" -o -name "*.mk"'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles_git/ --work-tree=$HOME'

alias todo='/usr/bin/git --git-dir=$HOME/.todo_git/ --work-tree=$HOME'

alias ggrep='git grep --recurse-submodules'
