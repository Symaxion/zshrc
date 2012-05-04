#!/bin/zsh
# Checks for updates on my rc files
# vim:syntax=zsh

trap '' 2

# Vim

cd ~/vimrc

if git fetch --dry-run 2>&1 | grep -q '.'; then
    echo
    echo "Updating vimrc..."
    git pull
    case $(uname -s) in
        Cygwin*|CYGWIN*)
            yes | $(pwd)/mkwincopy.sh
            ;;
        *)
            ;;
    esac
    echo
fi

# Zsh

cd ~/zshrc
if git fetch --dry-run 2>&1 | grep -q '.'; then
    echo
    echo "Updating zshrc..."
    git pull
    echo
    echo "################################################################"
    echo "    Zshrc was updated! You may need to restart your shell!"
    echo "################################################################"
    echo
fi

# End
cd

trap 2
