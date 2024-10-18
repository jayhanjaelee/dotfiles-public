export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
#
export PATH="/usr/local/Cellar/php/8.3.11/bin/php:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

alias sd="cd ~ && cd \$(find * -type d 2> /dev/null | fzf --layout reverse --border --height 50%)"
alias v="nvim"
alias vim="nvim"

# fzf
source /opt/homebrew/Cellar/fzf/0.55.0/shell/key-bindings.zsh
source /opt/homebrew/Cellar/fzf/0.55.0/shell/completion.zsh

# lazygit
alias lg="lazygit"
