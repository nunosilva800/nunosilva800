fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# brew bins
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
## set to append immediatly to history
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
## store the timestamps of commands
setopt EXTENDED_HISTORY
## hide duplicate commands when searching history
setopt HIST_FIND_NO_DUPS

alias ls='ls -G'
alias ll='ls -lhaG'

# git aliases
alias gs='git status '
alias gb='git branch '
alias gf='git fetch '
alias gb='git branch '
alias gpl='git pull '
alias gps='git push '
alias gco='git checkout '
alias gpoh='git push origin head -u '
alias grom='git rebase origin/master '

export CLICOLOR=1
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=~/.local/bin:$PATH

# boot https://starship.rs/
eval "$(starship init zsh)"

# gnubin to override detault make (v3) with brew's make (v4)
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

# Android dev
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add system ruby gem path instead of RVM
export GEM_HOME="$HOME/.gem"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
