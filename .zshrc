export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  fzf
  )
source $ZSH/oh-my-zsh.sh

LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
alias python="python3"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias vi="nvim"
alias vim="nvim"

export TERM=xterm-256color

# zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}
