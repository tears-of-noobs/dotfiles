export TERM=rxvt-unicode-256color

if [ ! -d ~/.zgen ]; then
    git clone https://github.com/tarjoilija/zgen "${HOME}/.zgen"
fi

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then 
    echo "Configure zgen"

    zgen prezto '*:*' color 'yes'
    zgen prezto pacman frontend 'yaourt'

    zgen prezto
    zgen prezto git
    zgen prezto command-not-found
    zgen prezto history-substring-search
    zgen prezto syntax-highlighting
    zgen prezto pacman

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load tarruda/zsh-autosuggestions
    zgen load seletskiy/zsh-prompt-lambda17


    zgen save 
fi

export HISTFILE=$HOME/.history
export HISTSIZE=500
export SAVEHIST=100000

MYHOST="pornhub.s"
PROMPT_TEXT="λ"


precmd () {
    print -Pn "\e]0;$PROMPT_TEXT $(pwd)\a"
}

if [ $MYHOST != $HOST ];
then
    PROMPT_TEXT="$HOST"
    precmd () {
        last_cmd=$(cat $HISTFILE | tail -n1 | cut -d \; -f2)
        print -Pn "\e]0;$HOST $last_cmd \a"
    }
fi


autoload -Uz promptinit

promptinit
prompt lambda17
zstyle "lambda17:00-banner" bg "125"
zstyle "lambda17:05-sign" bg "125"
zstyle "lambda17:05-sign" fg "195"
zstyle 'lambda17:05-sign' text "ζ"


export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=$HOME/projects/golang
export EDITOR=vim
export PATH=$PATH:$GOPATH/bin

source "${HOME}/.zaliases"
