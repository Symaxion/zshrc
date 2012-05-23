
_publ_two_modes() {
    echo "publ: can only specify one mode (s, r or f)." >&2
}

publ() {
    mode=""
    dest=""

    while getopts "srfld:" opt; do
        case $opt in
        s)
            if [ -n "$mode" ]; then 
                _publ_two_modes; 
                return 1; 
            fi

            mode="share"
            ;;
        r)
            if [ -n "$mode" ]; then _publ_two_modes; return 1; fi
            mode="retrieve"
            ;;
        l|f)
            if [ -n "$mode" ]; then _publ_two_modes; return 1; fi
            mode="filter"
            ;;
        d)
            if [ -n "$dest" ]; then
                echo "publ: can only specify one destination" >&2
                return 1
            fi
            dest=$OPTARG
            ;;
        \?)
            return 1;
            ;;
        esac
    done

    while [ $OPTIND -gt 1 ]; do
        OPTIND=$(($OPTIND-1))
        shift
    done

    if [ -z $mode ]; then 
        mode="share"; 
    fi

    if [ -z $dest ]; then
        dest="synthi"; 
    fi

    case $dest in
    ssy|seysayux|synthi)
        case $mode in
        share)
            for x in "$@"; do
                scp $x frank@seysayux.net:/files
            done
            ;; 
        retrieve)
            for x in "$@"; do
                wget http://seysayux.net/files/$x -O $(basename $x)
            done
            ;;
        filter)
            if [ -z "$*" ]; then
                ssh frank@seysayux.net -t "ls /files"
            else
                ssh frank@seysayux.net -t "ls /files | grep $*"
            fi
            ;;
        esac
        ;;
    dropbox)
        if [ '!' -d ~/Dropbox ]; then
            echo "publ: Dropbox not installed on this computer." >&2
            return 1;
        fi

        case $mode in
        share)
            for x in "$@"; do
                cp $x ~/Dropbox/Public
            done
            ;;
        retrieve)
            for x in "$@"; do
                cp ~/Dropbox/Public/$x .
            done
            ;;
        filter)
            if [ -z "$*" ]; then
                ls ~/Dropbox/Public
            else
                ls ~/Dropbox/Public | grep "$*"
            fi
            ;;
        esac
        ;;
    *)
        echo "publ: unknown destination: $dest" >&2
        return 1
        ;;  
    esac

}
