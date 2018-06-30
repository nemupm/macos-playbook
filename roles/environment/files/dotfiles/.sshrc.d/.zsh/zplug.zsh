# install
if [ ! -d $ZPLUG_HOME ]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

# zplug
source $ZPLUG_HOME/init.zsh

# history search
zplug "zsh-users/zsh-history-substring-search"
# Load theme file
zplug 'dracula/zsh', as:theme
# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
# Also prezto
zplug "modules/prompt", from:prezto
# enhancd
export ENHANCD_DIR=$MY_HOME/.enhancd
zplug "b4b4r07/enhancd", use:init.sh
# peco
zplug "peco/peco", \
    as:command, \
    from:gh-r
# peco history search
zplug "jimeh/zsh-peco-history"
# zsh plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

# install plugins
if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
