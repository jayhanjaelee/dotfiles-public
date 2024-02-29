export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  fzf
  z
  )
source $ZSH/oh-my-zsh.sh

LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8

export TERM=xterm-256color

zstyle ':completion:*' menu select
