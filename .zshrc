# Example of a zshrc file for zshfw.

# Enable debug output
# export ZSHFW_DEBUG=1

# Setup search path for zshfw extensions
export ZSHFW_PATH="$HOME/.zshfw:$HOME/.zsh"

# Load zshfw
source "$HOME/.zshfw/zshfw"

# Load theme
DEFAULT_ENABLE_VCS_INFO=1
DEFAULT_ENABLE_GIT_STATUS=1
zshfw theme load default

# Load plugins
zshfw plugin load vimode func bashlike history dotfiles

zshfw plugin load zshlocal
