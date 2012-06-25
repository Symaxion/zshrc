manpre () { 
    man -t $@ | open -f -a /Applications/Preview.app 
}

alias man=manpre
