print "[zshenv]"

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

# direnv
eval "$(direnv hook zsh)"

# java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# sdkman!
print " Load sdkman!"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# nvm
print " Load nvm"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# rbenv
print " Load rbenv"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
print " Load pyenv"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# gvm
print " Load gvm"
unalias gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
