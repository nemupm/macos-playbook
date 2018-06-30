# tmux
tmuxrc() {
    local TMUXDIR=/tmp/.nemupm.tmux
    if ! [ -d $TMUXDIR ]; then
        rm -rf $TMUXDIR
        mkdir -p $TMUXDIR
    fi
    rm -rf $TMUXDIR/.sshrc.d
    cp -rf $SSHHOME/.sshrc $SSHHOME/bashsshrc $SSHHOME/sshrc $SSHHOME/.sshrc.d $TMUXDIR
    SSHHOME=$TMUXDIR SHELL=$TMUXDIR/bashsshrc /usr/bin/tmux -S $TMUXDIR/tmuxserver -f $TMUXDIR/.sshrc.d/.tmux.conf $@
}

# zplug
export ZPLUG_HOME=$MY_HOME/.zplug

# locale
export LC_CTYPE=$LANG
