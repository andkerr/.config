# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't tell me that zsh is the default macOS shell now
export BASH_SILENCE_DEPRECATION_WARNING=1

# Setting PATH for custom shell scripts
if [ -d $HOME/bin/ ]; then
    export PATH=$PATH:$HOME/bin/
fi

# Setting PATH for custom shell scripts
if [ -d $HOME/.local/bin ]; then
    export PATH=$PATH:$HOME/.local/bin/
fi

# include racket command line tools
if [ -d "/Applications/Racket v8.8/bin" ]; then
    export PATH=$PATH:/Applications/Racket\ v8.8/bin
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# custom prompt
PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\W\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] "

# >>> aliases >>>

# long file format
alias l='ls -la'

# dotfiles - runs commands against my dotfiles repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# eecs281 Makefile CAEN rsync
alias s2c='make sync2caen'

# condense spaces
alias csp='sed -e "s/[[:space:]]\{2,\}/ /g"'

# login to CAEN
alias caen='ssh kerrand@login.engin.umich.edu'

CXXFLAGS='-Wall -pedantic-errors -std=c++17'
alias cc='g++ ${CXXFLAGS}'

# OS-specific aliases

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias sapt='sudo apt'
    alias pbcopy='xclip -sel clip'
    alias l='ls -laF --color -h --group-directories-first'
elif [[ "$OSTYPE" == "darwin20" ]]; then
    export BASH_SILENCE_DEPRECATION_WARNING=1
    alias l='ls -laFh'
fi

# <<< aliases <<<


# >>> functions >>>>

mcd() {
    mkdir -p $1
    cd $1
}

# <<< functions <<<

# node setup commands
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

[ -f "/Users/andrewkerr/.ghcup/env" ] && source "/Users/andrewkerr/.ghcup/env" # ghcup-env
