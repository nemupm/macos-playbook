# check environment and install zinit
__zsh::zinit::install()
{
    git clone https://github.com/zdharma-continuum/zinit $ZINIT_HOME
    chmod -R 755 $ZINIT_HOME
}

__zsh::zinit::check()
{
    local _ZINIT_HOME_DEFAULT="$HOME/.zinit"
    local _ZINIT_HOME_MACOS="/usr/local/opt/zinit"

    if [ -z "$ZINIT_HOME" ]; then
        if [ -d $_ZINIT_HOME_DEFAULT ]; then
            export ZINIT_HOME="$_ZINIT_HOME_DEFAULT"
        elif [ -d $_ZINIT_HOME_MACOS ]; then
            export ZINIT_HOME="$_ZINIT_HOME_MACOS"
        else
            export ZINIT_HOME="$_ZINIT_HOME_DEFAULT"
            __zsh::zinit::install
        fi
    elif [ ! -d $ZINIT_HOME ]; then
        __zsh::zinit::install
    fi
}

__zsh::zinit::check

# zinit
source $ZINIT_HOME/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# plugins
zinit wait lucid light-mode for \
      b4b4r07/enhancd \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start;"\
"export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(end-of-line vi-end-of-line vi-add-eol);"\
"export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(forward-char vi-forward-char "\
"forward-word emacs-forward-word vi-forward-word vi-forward-word-end vi-forward-blank-word "\
"vi-forward-blank-word-end vi-find-next-char vi-find-next-char-skip)" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions \
  from"gh-r" as"program" atinit"export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'" \
      junegunn/fzf
# history search
zstyle ":history-search-multi-word" page-size "30"
zinit ice wait"1" lucid
zinit load zdharma-continuum/history-search-multi-word

# snippet
zinit is-snippet for \
      OMZL::git.zsh \
      OMZP::git \
      PZT::modules/helper/init.zsh

# kubernetes
zinit wait lucid for \
      OMZ::plugins/kubectl/kubectl.plugin.zsh
# disabled because it might break path completion
#zinit wait"1" lucid light-mode for \
#  from"gh-r" as"program" mv"*/cache_builder -> cache_builder" pick"cache_builder" \
#  atload"(pgrep cache_builder >/dev/null || nohup cache_builder </dev/null >/dev/null 2>&1 &)" \
#     @bonnefoa/kubectl-fzf \
#  atload"export KUBECTL_FZF_OPTIONS=(--height 100%); zicdreplay" \
#     @bonnefoa/kubectl-fzf

# direnv
zinit ice wait lucid from"gh-r" as"program" mv"direnv* -> direnv"
zinit light direnv/direnv
