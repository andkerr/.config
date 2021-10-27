# Direct terminal to read .bash_rc each new session
if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi


# Setting PATH for PostgreSQL
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

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
# <<< conda initialize <<<


# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

