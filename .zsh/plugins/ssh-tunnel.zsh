# Easy ssh tunneling

ssh-tunnel() {
    if echo "$1" | grep -q :; then
        host=$(echo "$1" | cut -f1 -d:) 
        port=$(echo "$1" | cut -f2 -d:)
        shift
    else
        host="$1"
        port="$2"
        shift
        shift
    fi

    if [ -z "$1" ]; then
        tunnel=seysayux.net
    else
        tunnel="$1"
    fi

    ssh -f "$tunnel" -L "$port":"$host":"$port" -N
}
