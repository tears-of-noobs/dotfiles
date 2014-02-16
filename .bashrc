#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1="[\[\e[0;32m\]\u@\h\[\e[m\]] \[\e[0;34m\]\w\[\e[m\] \[\e[0;33m\]\[\e[m\]\$ "
export MC_SKIN=$HOME/.mc/solarized.ini
export JDK_HOME="/opt/jre"
export GOPATH=$HOME/projects/golang/src/gos
export PATH=$PATH:$HOME/projects/golang/bin
eval `dircolors ~/.dircolors`

alias db1='ssh platonov@db1.farm.s'
alias db2='ssh platonov@db2.farm.s'
alias db3='ssh platonov@db3.farm.s'
alias db4='ssh platonov@db4.farm.s'
alias db5='ssh platonov@db5.farm.s'
alias db6='ssh platonov@db6.farm.s'

alias master='ssh platonov@master.farm.s'
alias master2='ssh platonov@master2.farm.s'

