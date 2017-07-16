# tmux
if [ $SHLVL = 1 ]; then
  tmux attach || tmux
fi

for f in language zplug aliases setopt prompt
do
  source $HOME/.zsh/${f}.zsh
done
