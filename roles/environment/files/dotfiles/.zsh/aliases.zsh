# enble to subl command in tmux
alias subl='reattach-to-user-namespace subl'

# git
alias g='cd $(ghq root)/$(ghq list | peco)'
function gh(){
    repo_dir=$(ghq list | peco)
    github_host=$(echo ${repo_dir}| cut -d "/" -f 1)
    repo=$(echo ${repo_dir}| cut -d "/" -f 2,3)
    GITHUB_HOST=${github_host} hub browse ${repo}
}
eval "$(hub alias -s)"

# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/"$@" ;}

# jetbrains
alias idea='open -a /Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea'
alias webstorm='open -a /Applications/WebStorm.app/Contents/MacOS/webstorm'
alias phpstorm='open -a /Applications/PhpStorm.app/Contents/MacOS/phpstorm'
alias rubymine='open -a /Applications/RubyMine.app/Contents/MacOS/rubymine'
alias pycharm='open -a /Applications/PyCharm.app/Contents/MacOS/pycharm'
alias clion='open -a /Applications/CLion.app/Contents/MacOS/clion'
alias rider='open -a /Applications/Rider\ EAP.app/Contents/MacOS/rider'

# tmux
alias t="tmux attach || tmux"

# for tmux ssh setting
function ssh() {
    if [[ -n $(printenv TMUX) ]]
    then
        # change window name
        local window_name=$(tmux display -p '#{window_name}')
        hostname="$@[-1]"
        split_name=("${(@s/./)hostname}")
        tmux rename-window -- "$split_[1]" # zsh specified
        command ssh $@
        tmux rename-window $window_name
    else
        command ssh $@
    fi
}

# get paths quickly
function expand_path() {
    cur_dir=$(ls -U -d "$(pwd)"/* 2>/dev/null | head -n 100)
    parent_dir=$(ls -U -d "$(dirname $(pwd))"/* 2>/dev/null | head -n 100)
    ghq_dir=$(ghq list -p)
    ecd_dir=$(cat $ENHANCD_DIR/enhancd.log)
    BUFFER=${LBUFFER}$(echo "${cur_dir}\n${parent_dir}\n${ghq_dir}\n${ecd_dir}"| peco)${RBUFFER}
}
zle -N expand_path
bindkey "^x^p" expand_path
