if [[ $ZSHFW_SYSTEM == 1 ]]; then
    export ZSHFW_SYSTEM_DIR=/etc/zsh
    source $ZSHFW_SYSTEM_DIR/zshfw
fi

if [[ $ZSHFW_SYSTEM -ne 1 && $ZSHFW_LOADED -ne 1 ]]; then
    export ZSHFW_USER_DIR=$HOME/.zsh
    source $ZSHFW_USER_DIR/zshfw
fi

loadtheme default

loadplugins vimode func bashlike history ssh-tunnel publ
loadplugins nocorrect dotfiles

loadplugin zshlocal
