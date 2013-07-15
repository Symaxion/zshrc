# Command to send growl messages on OS X

growl_has_help=1

growl_help() {
    cat << 'EOF'

    %BGrowl%b - Send Growl messages on OS X
    %BAuthor:%b Frank Erens %U<frank@synthi.net>$u
    %BDependencies:%b None
    %BKnown conflicts:%b None

EOF
}

growl() {
      local msg="\\e]9;\n\n${*}\\007"
      case $TERM in
        screen*)
          echo -ne '\eP'${msg}'\e\\' ;;
        *)
          echo -ne ${msg} ;;
      esac
      return
}
