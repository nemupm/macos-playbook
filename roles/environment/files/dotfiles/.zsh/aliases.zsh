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
