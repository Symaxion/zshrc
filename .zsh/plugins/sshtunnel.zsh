# Easy ssh tunneling

sshtunnel_has_help=1

sshtunnel_help() {
    cat << 'EOF'

    SSHTunnel - Easy SSH tunneling
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

EOF
}

if [[ -z "$SSH_TUNNEL_DEFAULT" ]]; then
    plugin_error 'SSH_TUNNEL_DEFAULT not set.'
    return
fi

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
        tunnel=$SSH_TUNNEL_DEFAULT
    else
        tunnel="$1"
    fi

    ssh -f "$tunnel" -L "$port":"$host":"$port" -N
}
