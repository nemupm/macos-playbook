# tmux
tmux attach || tmux

for f in zplug aliases setopt prompt
do
    source $HOME/.zsh/${f}.zsh
done
