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
# fzf
zplug "junegunn/fzf-bin", \
    as:command, \
    rename-to:"fzf", \
    from:gh-r
# enhancd
zplug "b4b4r07/enhancd", use:init.sh
# vagrant global-status/box controller
zplug 'gongo/pecrant', as:command
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
# typora-notebook
zplug "nemupm/typora-notebook", use:init.sh

# install plugins
if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
