if [ -d ~/.local/bin ]; then
    PATH=~/.local/bin:$PATH
fi

if [ -d ~/.local/lib ]; then
    if [ -z $LD_LIBRARY_PATH ]; then
        LD_LIBRARY_PATH=~/.local/lib
    else
        LD_LIBRARY_PATH=~/.local/lib:$LD_LIBRARY_PATH
    fi
fi

if [ -d ~/.local/lib/pkgconfig ]; then
    if [ -z $PKG_CONFIG_PATH ]; then
        PKG_CONFIG_PATH=~/.local/lib/pkgconfig
    else
        PKG_CONFIG_PATH=~/.local/lib/pkgconfig:$PKG_CONFIG_PATH
    fi
    export PKG_CONFIG_PATH
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
