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
history -cw
set +o history

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# custom prompt
PS1='\w $ '

# >>> aliases >>>

# long file format
alias l='ls -laF --color -h --group-directories-first'

# dotfiles - runs commands against my dotfiles repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# activate and navigate to 'kerr' conda enivronment
alias ke='cd ~/mambaforge/envs/kerr; conda activate kerr'

# activate and navigate to 'tpyth' conda environment
alias tp='cd ~/mambaforge/envs/tpyth; conda activate tpyth'

# activate and navigate to 'glotzer' conda environment
alias glot='cd ~/mambaforge/envs/glotzer; conda activate glotzer'

# activate and navigate to 'physics411' conda environment
alias p411='cd ~/mambaforge/envs/physics411; conda activate physics411'

# activate and navigate to 'physics453' conda environment
alias p453='cd ~/mambaforge/envs/physics453; conda activate physics453'

# activate and navigate to 'msdt' conda environment
alias mdst='cd ~/mambaforge/envs/mdst; conda activate mdst'

# activate and navigate to 'mhackers' conda environment
alias mh='cd ~/mambaforge/envs/mhackers; conda activate mhackers'

# OS-specific aliases

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias sapt='sudo apt'
    alias pbcopy='xclip -sel clip'
fi

# <<< aliases <<<


# >>> functions >>>>

mcd() {
    mkdir -p $1
    cd $1
}

# <<< functions <<<
