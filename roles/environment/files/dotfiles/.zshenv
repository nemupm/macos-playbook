# PATH
export PATH=/usr/local/bin:$PATH

# encode
export LANG=ja_JP.UTF-8

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug

# save history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# sdkman!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# gvm
unalias gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
