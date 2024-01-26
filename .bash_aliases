#!/bin/bash

export BUILD_CACHE_ROOT="/import/Engineering/Multiviewer/Builds/MVX/firmware/Jenkins"
export MVX_APP_ROOT="$HOME/dev/mvx-app"
export CURRENT_CARD=172.17.160.82
export CARD_PASSWD="mvx"

case $- in
    *i*) ;;
      *) return;;
esac

alias cusr="users | tr ' ' '\n' | uniq -c"

alias ducks="du -cksh * | sort -hr | head -n 15"

alias fcpp="find . -regex '.*\.\(h\|c\|cpp\)'"

alias less="less -R"

alias fmake="find -type f -name 'makefile*' -o -name '*.mk'"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles_git/ --work-tree=$HOME"

alias ggrep="git grep --recurse-submodules"
