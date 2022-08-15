#!/bin/bash
mkdir -p ~/.local/share/fonts

cd /tmp
fonts=(
"Hack"
"Iosevka"
"RobotoMono"
"FantasqueSansMono"
)

for font in ${fonts[@]}
do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$font.zip
    sudo unzip $font.zip -d $HOME/.local/share/fonts/$font/
    rm $font.zip
done
fc-cache -f -v
