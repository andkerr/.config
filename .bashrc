# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Setting PATH for custom shell scripts
if [ -d $HOME/bin/ ]; then
    export PATH=$PATH:$HOME/bin/
fi

# Setting PATH for custom shell scripts
if [ -d $HOME/.local/bin ]; then
    export PATH=$PATH:$HOME/.local/bin/
fi

# disable command history
# history -cw
# set +o history

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# custom prompt
PS1='\W $ '

# >>> aliases >>>

# long file format
alias l='ls -la'

# dotfiles - runs commands against my dotfiles repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# OS-specific aliases

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias sapt='sudo apt'
    alias pbcopy='xclip -sel clip'
    alias l='ls -laF --color -h --group-directories-first'
elif [[ "$OSTYPE" == "darwin20" ]]; then
    export BASH_SILENCE_DEPRECATION_WARNING=1
    alias l='ls -laFh'
fi

alias weatherTO='curl wttr.in/Toronto?m'
alias weatherAA='curl wttr.in/Ann_Arbor?m'

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
