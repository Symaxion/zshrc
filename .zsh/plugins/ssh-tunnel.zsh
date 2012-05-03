# Easy ssh tunneling

ssh-tunnel() {
    if echo "$1" | grep -q :; then
        host=$(echo "$1" | cut -f1 -d:) 
        port=$(echo "$1" | cut -f2 -d:) 
    else
        host="$1"
        port="$2"
    fi
    ssh -f seysayux.net -L "$port":"$host":"$port" -N
}
