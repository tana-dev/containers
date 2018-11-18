# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Setting tty
if [ x$TERM = xdumb ]; then
    export TERM=xterm-256color
    exec >/dev/tty 2>/dev/tty </dev/tty
    cd $HOME
fi

# User specific environment and startup programs
HISTFILESIZE=100000
HISTSIZE=100000

# Path
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/bin
PATH=$PATH:/usr/local
PATH=$PATH:/usr/local/bin

# Export
export PS1="[\u@\h \W]\\$ "
export LESSCHARSET=utf-8
export PATH
