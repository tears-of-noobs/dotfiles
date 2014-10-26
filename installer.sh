#!/bin/sh

THEME=$1
if [ "$THEME" != "light" ] && [ "$THEME" != "dark" ]
then 
    echo "Incorrect or empty theme name"
    exit 1;
fi 

DEPENDENCY_PACKAGES=("rxvt-unicode" "vim" "zsh" "i3-wm" "xorg-xrdb" "git" "mc")
RXVT_COLORSCHEME_DIR=~/.Xdefaults

echo "This script bootstraping your environment with ${THEME} solarized color scheme" 

for p in ${DEPENDENCY_PACKAGES[@]}
do 
    if (pacman -Q $p > /dev/null)
    then 
        echo "Dependency package "$p" installed"
    else 
        echo "Installing missing package "$p""
        pacman -S $p --noconfirm
    fi
done

echo "Copying fonts"
cp .fonts/* ~/.fonts && fc-cache -f

echo "Copying dircolors"
cp .dircolors ~/

echo "Installing solarized theme for Midnight commander"
if [ ! -d ~/.mc ] 
then 
    mkdir ~/.mc
fi 

cp .mc/solarized.ini ~/.mc/


echo "Setting up theme for rxvt-unicode" 
if [ ! -d "$RXVT_COLORSCHEME_DIR" ] 
then 
    mkdir ${RXVT_COLORSCHEME_DIR}
fi 

TH=$(cat .Xdefaults/solarized."$THEME")
cat .Xdefaults/solarized.base | awk  -v TH="$TH" '{sub(/{THEME}/, TH); print; }' > "$RXVT_COLORSCHEME_DIR"/solarized.scheme
cp .Xresources ~/
xrdb -merge ~/.Xresources

echo "Setting up zsh" 

if [ $SHELL != "/usr/bin/zsh" ] 
then 
    echo "You current shell not ZSH"
    echo "Change shell"
    chsh -s /usr/bin/zsh
fi

if [ ! -d ~/.oh-my-zsh ] 
then 
    echo "Installing Oh-my-zsh from github repo"
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

ALIASES=""

echo -n "Would you like install default aliases into zshrc? (y/N) "

read item 

case "$item" in 
    y|Y)
        ALIASES=$(cat .zshrc.alias)
        cat .zshrc.base | awk  -v ALIASES="$ALIASES" '{sub(/{ZSH_ALIASES}/, ALIASES); print; }' > ~/.zshrc
        echo "Aliases installed!"
        ;;

    n|N)
        cat .zshrc.base | awk  -v ALIASES="$ALIASES" '{sub(/{ZSH_ALIASES}/, ALIASES); print; }' > ~/.zshrc
        ;; 

    *)
        cat .zshrc.base | awk  -v ALIASES="$ALIASES" '{sub(/{ZSH_ALIASES}/, ALIASES); print; }' > ~/.zshrc
        ;;
         
esac

echo "Setting up VIM"
cp .vimrc ~/ 
if [ ! -d ~/.vim ] 
then 
    mkdir -p ~/.vim/colors

else 
    if [ ! -d ~/.vim/colors ]
    then 
        mkdir ~/.vim/colors 
    fi 
fi

cp .vim/colors/solarized.vim ~/.vim/colors/

if [ ! -d ~/.vim/bundle ]
then 
    mkdir ~/.vim/bundle 
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Finished!"
