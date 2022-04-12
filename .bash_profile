echo .bash_profile

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andrewkerr/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andrewkerr/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/andrewkerr/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andrewkerr/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/andrewkerr/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/andrewkerr/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

