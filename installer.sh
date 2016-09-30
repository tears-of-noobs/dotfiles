#!/bin/sh

DEPENDENCY_PACKAGES=(
    "rxvt-unicode" "vim" "mcabber" "zsh" "i3-wm" "go"
    "xorg-xrdb" "git" "pptpclient")

RXVT_COLORSCHEME_DIR=~/.Xdefaults

echo "This script bootstraping your environment with seoul256 color scheme" 

for p in ${DEPENDENCY_PACKAGES[@]}
do 
    if (pacman -Q $p > /dev/null)
    then 
        echo "Dependency package "$p" installed"
    else 
        echo "Installing missing package "$p""
        sudo pacman -S $p --noconfirm
    fi
done

echo "Copying fonts"
mkdir ~/.fonts && cp .fonts/* ~/.fonts && fc-cache -f

echo "Copying dircolors"
cp .dircolors ~/

echo "Setting up theme for rxvt-unicode" 
if [ ! -d "$RXVT_COLORSCHEME_DIR" ] 
then 
    mkdir ${RXVT_COLORSCHEME_DIR}
fi 

cp .Xdefaults/rxvt.theme "$RXVT_COLORSCHEME_DIR"/rxvt.theme
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

echo "Copying zshrc"
cp .zshrc ~/


echo "Setting up VIM"
cp .vimrc ~/ 

if [ ! -d ~/.vim/bundle ]
then 
    mkdir ~/.vim/bundle 
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Installing VIM plugins"

vim -c 'PluginInstall' -c 'qa!'

echo "Installing Go binaries"

vim -c 'GoInstallBinaries' -c 'qa!'

VIMGO_PLUG="~/.vim/bungle/vim-go/"
VIMGO_COMMIT="adee79b3c48a77df0049ab48cc8bf78790ee5aa2"

SYNTASTIC_PLUG="~/.vim/bungle/syntastic/"
SYNTASTIC_COMMIT="ebadf9aff53da37b80becbb1f60f473c3ccfb555"

echo "Checkouting to preferred commits"

cd "$VIMGO_PLUG" && git checkout "$VIMGO_COMIT"
cd "$SYNTASTIC_PLUG" && git checkout "$SYNTASTIC_COMMIT"

vim -c 'GoInstallBinaries' -c 'qa!'

echo "Finished!"
