fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# macos basics
export CLICOLOR=1
## history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
### set to append immediatly to history
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
### store the timestamps of commands
setopt EXTENDED_HISTORY
### hide duplicate commands when searching history
setopt HIST_FIND_NO_DUPS

# Aliases
alias ls='ls -G'
alias ll='ls -lhaG'
## Git
alias gs='git status '
alias gb='git branch '
alias gf='git fetch '
alias gb='git branch '
alias gpl='git pull '
alias gps='git push '
alias gco='git checkout '
alias gpoh='git push origin head -u '
alias grom='git rebase origin/master '

# brew bins to override macos defaults
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# boot https://starship.rs/
eval "$(starship init zsh)"
