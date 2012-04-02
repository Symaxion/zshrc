# Slightly saner default PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

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
plugins=(prompt vimode take bashlike history)

for x in ${plugins[@]}; do
    if [ -f $HOME/.zsh/plugins/$x.zsh ]; then
        source $HOME/.zsh/plugins/$x.zsh
    else
        echo "zsh: warning, could not find plugin '$x'." >&2
    fi
done

# /opt/projects alternate prefix
# export PROJPREFIX=/opt/projects
# export PATH=$PROJPREFIX/bin:$PATH
# export MANPATH=$PROJDIRPREFIX/share/man:$MANPATH
# export DYLD_LIBRARY_PATH=$PROJPREFIX/lib:$DYLD_LIBARY_PATH
# export LIBRARY_PATH=$PROJPREFIX/lib:$LIBRARY_PATH
# export C_INCLUDE_PATH=$PROJPREFIX/include:$C_INCLUDE_PATH
# export CPLUS_INCLUDE_PATH=$PROJPREFIX/include:$CPLUS_INCLUDE_PATH
