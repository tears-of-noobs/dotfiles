#!/bin/sh

THEME=$1
if [ "$THEME" != "solarized-light" ] && 
    [ "$THEME" != "solorized-dark" ] &&
    [ "$THEME" != "seoul256-dark" ]
then 
    echo "Incorrect or empty theme name"
    exit 1;
fi 

DEPENDENCY_PACKAGES=("rxvt-unicode" "vim" "mcabber" "zsh" "i3-wm" "xorg-xrdb" "git")
RXVT_COLORSCHEME_DIR=~/.Xdefaults

echo "This script bootstraping your environment with ${THEME} color scheme" 

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

echo "Setting up theme for rxvt-unicode" 
if [ ! -d "$RXVT_COLORSCHEME_DIR" ] 
then 
    mkdir ${RXVT_COLORSCHEME_DIR}
fi 

cp .Xdefaults/"$THEME" "$RXVT_COLORSCHEME_DIR"/rxvt.theme
cp .Xresources ~/.Xresources
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

cp norm+.zsh-theme ~/.oh-my-zsh/themes/ 

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

if [ ! -d ~/.vim/bundle ]
then 
    mkdir ~/.vim/bundle 
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Setting up mcabber"

if [ ! -d ~/.mcabber ]
then 
    mkdir ~/.mcabber 
fi 
cp .mcabber/mcabberrc ~/.mcabber/ 

echo -n "Enter username: " 
read username 

sed -i "s/{{USERNAME}}/$username/" ~/.mcabber/mcabberrc 

echo -n "Enter password: " 
read password

sed -i "s/{{PASSWORD}}/$password/" ~/.mcabber/mcabberrc 


echo "Finished!"
