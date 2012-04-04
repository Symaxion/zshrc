# Slightly saner default PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$PATH:/usr/X11/bin

# Enable extra completion options
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath

# Enable autocomplete
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
_comp_options+=(globdots)

# Enable auto-correction
setopt correctall

# Allow typing folder names mean cd
setopt autocd

# Beep
setopt beep

# Enable advanced (regex) globbing
setopt extendedglob

# Plugins!
plugins=(prompt vimode take bashlike history mactex projprefix)

for x in ${plugins[@]}; do
    if [ -f $HOME/.zsh/plugins/$x.zsh ]; then
        source $HOME/.zsh/plugins/$x.zsh
    else
        echo "zsh: warning, could not find plugin '$x'." >&2
    fi
done

# Load local stuff
if [ -f "$HOME/.zsh_local" ]; then
    source "$HOME/.zsh_local"
fi