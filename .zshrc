# export ZSHFW_DEBUG=1

if [[ $ZSHFW_SYSTEM == 1 ]]; then
    export ZSHFW_SYSTEM_DIR=/etc/zsh
    source $ZSHFW_SYSTEM_DIR/zshfw
fi

if [[ $ZSHFW_SYSTEM -ne 1 && $ZSHFW_LOADED -ne 1 ]]; then
    export ZSHFW_USER_DIR=$HOME/.zsh
    source $ZSHFW_USER_DIR/zshfw
fi

DEFAULT_ENABLE_VCS_INFO=1
DEFAULT_ENABLE_GIT_STATUS=1
loadtheme default

loadplugins vimode func bashlike history publ nocorrect dotfiles reminder

SSH_TUNNEL_DEFAULT=seysayux.net
loadplugin sshtunnel

loadplugin zshlocal

