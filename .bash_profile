if [ -d ~/.local/bin ]; then
    PATH=~/.local/bin:$PATH
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
