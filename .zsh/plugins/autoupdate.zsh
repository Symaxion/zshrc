# Actual autoupdate caller
# Do not run this when logged in through ssh on OS X (keychain)
if [ $(uname -s) != "Darwin" -o -z "$SSH_CLIENT" -a -z "$SSH_TTY" ]; then
    ( zsh ~/.zsh/plugins/autoupdate-impl.sh & )
fi
