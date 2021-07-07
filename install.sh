#!/bin/bash
if [ ! -d "$HOME/.config" ]
then 
  mkdir $HOME/.config
fi

cp $(pwd)/nvim -r $HOME/.config
cp $(pwd)/alacritty -r $HOME/.config
cp $(pwd)/picom -r $HOME/.config

cp $(pwd)/.dwm -r $HOME
cp $(pwd)/.fff -r $HOME

if [ ! -f "$HOME/.zshrc" ]
then
  echo source $HOME/.fff/fffrc > $HOME/.profile
  source $HOME/.profile
else
  echo source $HOME/.fff/fffrc > $HOME/.zshrc
  source $HOME/.zshrc
fi

sudo cp $(pwd)/Meslo -r /usr/share/fonts
sudo cp $(pwd)/tamzen-font -r /usr/share/fonts

fc-cache -f -v

echo "Instalacion Terminada :)".
