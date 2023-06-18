#!/bin/bash

# Specify the source files
src_files=(~/.zshrc ~/.vimrc ~/.config/tmux/tmux.conf ~/.ideavimrc ~/.vrapperrc)

for file in "${src_files[@]}"; do
    file_name=$(basename "$file")
    cp "$file" "./$file_name"
    echo "Copied $file to ./$file_name"
done

nvim="~/.config/nvim/"

echo "cp nvim config."
cp -r "$nvim" "./.config/"
