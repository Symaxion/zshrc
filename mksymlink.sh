#!/bin/bash
dir=$(dirname $0)

echo "Linking from $dir..."

cd ~

ln -Fisv "$dir/.zsh"
ln -Fisv "$dir/.zshrc"
