if [ -d /opt/projects -a -z $NO_PROJPREFIX ]; then
    # /opt/projects alternate prefix
    export PROJPREFIX=/opt/projects
    export PATH=$PROJPREFIX/bin:$PATH
    export MANPATH=$PROJDIRPREFIX/share/man:$MANPATH
    export DYLD_LIBRARY_PATH=$PROJPREFIX/lib:$DYLD_LIBARY_PATH
    export LIBRARY_PATH=$PROJPREFIX/lib:$LIBRARY_PATH
    export C_INCLUDE_PATH=$PROJPREFIX/include:$C_INCLUDE_PATH
    export CPLUS_INCLUDE_PATH=$PROJPREFIX/include:$CPLUS_INCLUDE_PATH
fi
