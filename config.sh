if [ -n "$REPO" ]; then
    symlink $REPO/.zsh .zsh
    symlink $REPO/.zshrc .zshrc
else
    dir=$(dirname $PWD/$0)
    ln -sv $dir/.zsh ~/.zsh
    ln -sv $dir/.zshrc ~/.zshrc
fi
git clone https://github.com/SeySayux/zshfw .zshfw
