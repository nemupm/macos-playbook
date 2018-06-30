source $ZDOTDIR/.zsh/aliases.zsh

# tmux
if [ $SHLVL = 2 ]; then
  tmuxrc attach || tmuxrc
fi

for f in zplug setopt prompt
do
  source $ZDOTDIR/.zsh/${f}.zsh
done

