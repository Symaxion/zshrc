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

# Themes! 
loadtheme() {
    if [ -f $HOME/.zsh/themes/$theme.zsh ]; then
        source $HOME/.zsh/themes/$theme.zsh
    else
        echo "zsh: warning, could not lome theme '$theme'." >&2
    fi
}

theme=default
loadtheme

# Plugins!
loadplugins() {
    for x in ${plugins[@]}; do
        if [ -f $HOME/.zsh/plugins/$x.zsh ]; then
            source $HOME/.zsh/plugins/$x.zsh
        else
            echo "zsh: warning, could not find plugin '$x'." >&2
        fi
    done
}

plugins=(autoupdate vimode func bashlike history projprefix ssh-tunnel publ)
loadplugins

# Load local stuff
if [ -f "$HOME/.zsh_local" ]; then
    source "$HOME/.zsh_local"
fi
