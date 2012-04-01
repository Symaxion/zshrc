# Automatically tries to make a prompt that looks like the native one for the OS

uname=$(uname -s)

if [ $UID -eq 0 ]; then
    usuf='#'
else
    usuf='\$'
fi

case $uname in
Darwin)
    # Mac OS X
    export PS1="%m:%c %n$usuf "
    ;;
Linux|*)
    distro=$(lsb_release -si)
    case $distro in
        Ubuntu|Debian|*)
        # Default to Debian-like shell.
        export PS1="%n@%m:%~$usuf "
        ;;
    esac
    ;;
esac
