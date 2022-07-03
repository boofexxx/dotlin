HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_SPACE
unsetopt beep
bindkey -e

autoload -Uz compinit && compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

autoload -U select-word-style
select-word-style bash

setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'
RPROMPT="%F{141}\$vcs_info_msg_0_%f"
PROMPT='%F{141}%B%1~%b%f %# '
PROMPT='%F{7}%B%*%b%f '$PROMPT

alias ls='ls --color=auto --group-directories-first'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias dir='dir --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'
alias rm='rm -vi'
alias mv='mv -vi'
alias cp='cp -via'
alias ln='ln -v'
alias zellij='zellij -l compact'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
stty -ixon
